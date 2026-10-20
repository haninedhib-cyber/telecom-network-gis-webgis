-- telecom_sig : schéma du SIG local (démonstration)
-- Hiérarchie : centrale_optique > olt > sro > ftb > clients
-- Le tout relié par fibre_optique (transport, distribution, branchement)
-- Système de coordonnées : WGS 84 (EPSG:4326)
--
-- Usage :
--   createdb telecom_sig
--   psql -d telecom_sig -f database/schema.sql

CREATE EXTENSION IF NOT EXISTS postgis;

DROP TABLE IF EXISTS fibre_optique, clients, pro, ftb, sro, olt, centrale_optique CASCADE;

CREATE TABLE centrale_optique (
    id      SERIAL PRIMARY KEY,
    nom     VARCHAR(50) UNIQUE NOT NULL,
    adresse VARCHAR(120),
    geom    geometry(Point, 4326) NOT NULL
);

CREATE TABLE olt (
    id          SERIAL PRIMARY KEY,
    nom         VARCHAR(50) UNIQUE NOT NULL,
    fabricant   VARCHAR(50),
    nb_ports    INTEGER CHECK (nb_ports > 0),
    id_centrale INTEGER REFERENCES centrale_optique(id),
    geom        geometry(Point, 4326) NOT NULL
);

CREATE TABLE sro (
    id        SERIAL PRIMARY KEY,
    nom       VARCHAR(50) UNIQUE NOT NULL,
    splitter  VARCHAR(10) DEFAULT '1:32',
    id_olt    INTEGER REFERENCES olt(id),
    geom      geometry(Point, 4326) NOT NULL
);

CREATE TABLE ftb (
    id       SERIAL PRIMARY KEY,
    nom      VARCHAR(50) UNIQUE NOT NULL,
    nb_ports INTEGER DEFAULT 8 CHECK (nb_ports > 0),
    id_sro   INTEGER REFERENCES sro(id),
    geom     geometry(Point, 4326) NOT NULL
);

-- Point de raccordement rattaché à un SRO (à adapter à la définition du projet)
CREATE TABLE pro (
    id     SERIAL PRIMARY KEY,
    nom    VARCHAR(50) UNIQUE NOT NULL,
    id_sro INTEGER REFERENCES sro(id),
    geom   geometry(Point, 4326) NOT NULL
);

CREATE TABLE clients (
    id      SERIAL PRIMARY KEY,
    nom     VARCHAR(50) UNIQUE NOT NULL,
    adresse VARCHAR(120),
    id_ftb  INTEGER REFERENCES ftb(id),
    geom    geometry(Point, 4326) NOT NULL
);

CREATE TABLE fibre_optique (
    id          SERIAL PRIMARY KEY,
    nom         VARCHAR(50) UNIQUE NOT NULL,
    type_cable  VARCHAR(20) NOT NULL
                CHECK (type_cable IN ('transport', 'distribution', 'branchement')),
    capacite_fo INTEGER CHECK (capacite_fo > 0),
    geom        geometry(LineString, 4326) NOT NULL
);

-- Index spatiaux
CREATE INDEX ON centrale_optique USING GIST (geom);
CREATE INDEX ON olt              USING GIST (geom);
CREATE INDEX ON sro              USING GIST (geom);
CREATE INDEX ON ftb              USING GIST (geom);
CREATE INDEX ON pro              USING GIST (geom);
CREATE INDEX ON clients          USING GIST (geom);
CREATE INDEX ON fibre_optique    USING GIST (geom);
