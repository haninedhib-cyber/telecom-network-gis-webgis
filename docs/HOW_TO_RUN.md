# How to run the project

Two ways to see the project: a **quick demo** (nothing to install) and the **full stack** described in chapter 3 of the report.

## 1. Quick demo (no installation)

`webgis/index.html` is a standalone OpenLayers page with fictional data. Open it in a browser, or publish it online:

1. On GitHub: **Settings → Pages**.
2. Source: **Deploy from a branch**, branch `main`, folder `/ (root)`, then **Save**.
3. After about a minute the demo is available at  
   `https://haninedhib-cyber.github.io/telecom-network-gis-webgis/webgis/`

The demo covers: layer toggling, attribute inspection, adding a client (linked to the nearest FTB), deleting a feature, and distance measurement. Edits stay in the browser. Persistent edits require the full stack below (WFS-T).

## 2. Full stack (PostgreSQL/PostGIS → GeoServer → QGIS / GeoNetwork / OpenLayers)

**Requirements:** PostgreSQL with PostGIS, GeoServer, QGIS, GeoNetwork (optional).

### Database
```bash
createdb telecom_sig
psql -d telecom_sig -f database/schema.sql
psql -d telecom_sig -f database/sample_data.sql
```
The last query prints the number of features per table (1 central, 2 SRO, 4 FTB, 2 PRO, 4 clients, 10 cables).

### QGIS
**Layer → Add Layer → Add PostGIS Layers**, create a connection to `telecom_sig`, then load the seven tables.

### GeoServer
1. Create the workspace `telecom_sig`.
2. Add a **PostGIS** store pointing to the database.
3. Publish the layers (set the native SRS to `EPSG:4326`).
4. Enable transactions: **Services → WFS → Service Level: Transactional** (needed for add/modify/delete from the WebGIS).
5. Check the services: `http://localhost:8080/geoserver/telecom_sig/wms?request=GetCapabilities`

### GeoNetwork
Add the GeoServer WMS URL above as a service, then create ISO 19115 metadata records for each layer.

### WebGIS with GeoServer
Replace the in-memory sources in `webgis/index.html` with OpenLayers sources that read the WFS layers, and send edits as WFS-T transactions. If the browser blocks the requests, enable CORS on the application server running GeoServer.

> Use your own credentials locally and never commit passwords to the repository.
