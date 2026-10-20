-- Données FICTIVES de démonstration (Mahdia centre). Aucune donnée réelle de Tunisie Telecom.
-- Usage : psql -d telecom_sig -f database/sample_data.sql

INSERT INTO centrale_optique (nom, adresse, geom) VALUES
('NRO-MAHDIA', 'Centre-ville (fictif)', ST_SetSRID(ST_MakePoint(11.0622, 35.5047), 4326));

INSERT INTO olt (nom, fabricant, nb_ports, id_centrale, geom)
SELECT 'OLT-01', 'Huawei', 16, id, geom FROM centrale_optique WHERE nom = 'NRO-MAHDIA';

INSERT INTO sro (nom, splitter, id_olt, geom)
SELECT v.nom, '1:32', (SELECT id FROM olt WHERE nom = 'OLT-01'),
       ST_SetSRID(ST_MakePoint(v.lon, v.lat), 4326)
FROM (VALUES ('SRO-01', 11.0560, 35.5100), ('SRO-02', 11.0700, 35.5000)) AS v(nom, lon, lat);

INSERT INTO ftb (nom, nb_ports, id_sro, geom)
SELECT v.nom, 8, (SELECT id FROM sro WHERE nom = v.sro),
       ST_SetSRID(ST_MakePoint(v.lon, v.lat), 4326)
FROM (VALUES ('FTB-01', 'SRO-01', 11.0540, 35.5120), ('FTB-02', 'SRO-01', 11.0580, 35.5115),
             ('FTB-03', 'SRO-02', 11.0690, 35.5020), ('FTB-04', 'SRO-02', 11.0720, 35.5010))
     AS v(nom, sro, lon, lat);

INSERT INTO pro (nom, id_sro, geom)
SELECT v.nom, (SELECT id FROM sro WHERE nom = v.sro),
       ST_SetSRID(ST_MakePoint(v.lon, v.lat), 4326)
FROM (VALUES ('PRO1_SRO1', 'SRO-01', 11.0555, 35.5095), ('PRO2_SRO2', 'SRO-02', 11.0695, 35.4995))
     AS v(nom, sro, lon, lat);

INSERT INTO clients (nom, adresse, id_ftb, geom)
SELECT v.nom, 'Adresse fictive', (SELECT id FROM ftb WHERE nom = v.ftb),
       ST_SetSRID(ST_MakePoint(v.lon, v.lat), 4326)
FROM (VALUES ('C-001', 'FTB-01', 11.0535, 35.5125), ('C-002', 'FTB-02', 11.0585, 35.5122),
             ('C-003', 'FTB-03', 11.0685, 35.5025), ('C-004', 'FTB-04', 11.0725, 35.5015))
     AS v(nom, ftb, lon, lat);

-- Câbles : géométrie construite entre deux équipements
WITH noeuds AS (
    SELECT nom, geom FROM centrale_optique UNION ALL SELECT nom, geom FROM sro
    UNION ALL SELECT nom, geom FROM ftb     UNION ALL SELECT nom, geom FROM clients
)
INSERT INTO fibre_optique (nom, type_cable, capacite_fo, geom)
SELECT v.nom, v.type_cable, v.fo, ST_MakeLine(a.geom, b.geom)
FROM (VALUES
  ('TR-01', 'transport',    24, 'NRO-MAHDIA', 'SRO-01'),
  ('TR-02', 'transport',    24, 'NRO-MAHDIA', 'SRO-02'),
  ('DI-01', 'distribution', 12, 'SRO-01', 'FTB-01'),
  ('DI-02', 'distribution', 12, 'SRO-01', 'FTB-02'),
  ('DI-03', 'distribution', 12, 'SRO-02', 'FTB-03'),
  ('DI-04', 'distribution', 12, 'SRO-02', 'FTB-04'),
  ('BR-01', 'branchement',   1, 'FTB-01', 'C-001'),
  ('BR-02', 'branchement',   1, 'FTB-02', 'C-002'),
  ('BR-03', 'branchement',   1, 'FTB-03', 'C-003'),
  ('BR-04', 'branchement',   1, 'FTB-04', 'C-004')
) AS v(nom, type_cable, fo, de, vers)
JOIN noeuds a ON a.nom = v.de
JOIN noeuds b ON b.nom = v.vers;

-- Vérification : nombre d'équipements par table
SELECT 'centrale_optique' AS couche, count(*) FROM centrale_optique
UNION ALL SELECT 'sro', count(*) FROM sro UNION ALL SELECT 'ftb', count(*) FROM ftb
UNION ALL SELECT 'pro', count(*) FROM pro UNION ALL SELECT 'clients', count(*) FROM clients
UNION ALL SELECT 'fibre_optique', count(*) FROM fibre_optique;
