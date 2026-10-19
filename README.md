# 📡 Tunisie Telecom | Engineering Internship

<p align="center">
  <img src="https://img.shields.io/badge/TUNISIE_TELECOM-Engineering_Report-E53935?style=for-the-badge" alt="Tunisie Telecom" />
  <img src="https://img.shields.io/badge/ENIT-2025--2026-003366?style=for-the-badge" alt="ENIT" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/TELECOMMUNICATIONS-NETWORKS-2563EB?style=flat-square" alt="Telecommunications Networks" />
  <img src="https://img.shields.io/badge/GIS-SPATIAL_DATA-16A34A?style=flat-square" alt="GIS" />
  <img src="https://img.shields.io/badge/WEBGIS-INTERACTIVE_MAPPING-7C3AED?style=flat-square" alt="WebGIS" />
</p>

<p align="center">
  <strong>Telecommunications Networks · Geographic Information Systems · WebGIS</strong>
  <br />
  <em>Engineering Internship — Regional Directorate of Mahdia, Tunisia</em>
</p>

---

## 📄 Download the Internship Report

<p align="center">
  <a href="./Tunisie_Telecom_Internship_Report.pdf">
    <img src="https://img.shields.io/badge/⬇_DOWNLOAD_FULL_REPORT-PDF-DC2626?style=for-the-badge&logo=adobeacrobatreader&logoColor=white" alt="Download the full internship report" />
  </a>
</p>

<p align="center">
  <em>A technical report about telecommunications infrastructure, GIS and WebGIS technologies.</em>
</p>

---

## 👩‍💻 Internship Overview

<table>
  <tr>
    <td>🏢 <strong>Host Organization</strong></td>
    <td>Tunisie Telecom</td>
  </tr>
  <tr>
    <td>📍 <strong>Location</strong></td>
    <td>Regional Directorate of Mahdia, Tunisia</td>
  </tr>
  <tr>
    <td>🗺️ <strong>Department</strong></td>
    <td>Geographic Information Systems (GIS)</td>
  </tr>
  <tr>
    <td>🎓 <strong>Institution</strong></td>
    <td>National Engineering School of Tunis (ENIT)</td>
  </tr>
  <tr>
    <td>📅 <strong>Period</strong></td>
    <td>July 1–31, 2026</td>
  </tr>
  <tr>
    <td>📡 <strong>Field</strong></td>
    <td>ICT Engineering — Telecommunications</td>
  </tr>
</table>

This repository presents my engineering internship at Tunisie Telecom. It explores telecommunications access networks and the use of Geographic Information Systems to represent and manage network infrastructure.

## 🧭 What I Explored

<table>
  <tr>
    <td width="50%" valign="top">
      <h3>🌐 Telecommunications Networks</h3>
      <ul>
        <li>Copper access networks</li>
        <li>Point-to-Point (P2P)</li>
        <li>Gigabit Passive Optical Network (GPON)</li>
        <li>AirPON</li>
        <li>Optical network equipment</li>
      </ul>
    </td>
    <td width="50%" valign="top">
      <h3>🗺️ Geographic Information Systems</h3>
      <ul>
        <li>Geographic network representation</li>
        <li>Spatial data organization</li>
        <li>Technical plan integration</li>
        <li>Geographic metadata</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td width="50%" valign="top">
      <h3>🖥️ WebGIS</h3>
      <ul>
        <li>Interactive maps with OpenLayers</li>
        <li>Geographic data publication</li>
        <li>Map layer visualization</li>
        <li>Feature inspection and editing</li>
      </ul>
    </td>
    <td width="50%" valign="top">
      <h3>🗄️ Spatial Databases</h3>
      <ul>
        <li>PostgreSQL and PostGIS</li>
        <li>Spatial tables and attributes</li>
        <li>WMS and WFS services</li>
        <li>GeoNetwork metadata catalog</li>
      </ul>
    </td>
  </tr>
</table>

## 🏢 Chapter 1 — Host Organization

This chapter introduces Tunisie Telecom, the Regional Directorate of Mahdia, and the role of the GIS department in telecommunications network management.

It presents the organizational context of the internship and the importance of geographic data in supporting technical operations.

## 🌐 Chapter 2 — Telecommunications Networks

This chapter explores telecommunications access technologies and their geographic representation.

### Network Technologies

- **Copper networks** — Traditional telecommunications access.
- **P2P** — Point-to-Point fiber-optic connections.
- **GPON** — Gigabit Passive Optical Network.
- **AirPON** — Optical access solutions incorporating wireless technologies.

### Network Equipment and Infrastructure

| Component | Description |
|---|---|
| IPMSAN | Telecommunications access equipment |
| OLT | Optical Line Terminal |
| SRO | Optical distribution cabinet |
| PBO/FAT | Fiber-optic connection and distribution points |
| Fiber-optic cables | Physical optical network infrastructure |
| Underground chambers | Access points for network infrastructure |

The chapter explains how these components can be represented as geographic layers to facilitate network visualization and technical analysis.

## 🗺️ Chapter 3 — GIS & WebGIS Environment

This chapter covers the regional GIS workflow explored during the internship and a separate local environment used to understand GIS and WebGIS technologies.

### 🔹 Regional GIS Workflow

The internship included discovering the integration of technical network plans using CADReader and the cataloging of geographic information through GeoNetwork.

### 🔹 Local GIS/WebGIS Environment

The local learning and demonstration environment brought together database management, desktop GIS, map services and web mapping.

<p align="center">
  <img src="https://img.shields.io/badge/DATABASE-PostgreSQL_%7C_PostGIS-4169E1?style=flat-square&logo=postgresql&logoColor=white" alt="PostgreSQL and PostGIS" />
  <img src="https://img.shields.io/badge/DESKTOP_GIS-QGIS-589632?style=flat-square&logo=qgis&logoColor=white" alt="QGIS" />
  <img src="https://img.shields.io/badge/MAP_SERVER-GeoServer-4285F4?style=flat-square" alt="GeoServer" />
  <img src="https://img.shields.io/badge/WEB_MAPPING-OpenLayers-1F6B75?style=flat-square" alt="OpenLayers" />
  <img src="https://img.shields.io/badge/METADATA-GeoNetwork-39729B?style=flat-square" alt="GeoNetwork" />
</p>

### 🗄️ Spatial Database: `telecom_sig`

The local environment used a PostgreSQL/PostGIS database named `telecom_sig`, with tables representing different telecommunications assets.

| Table | Geographic data |
|---|---|
| `centrale_optique` | Optical central offices |
| `olt` | Optical Line Terminals |
| `sro` | Optical distribution cabinets |
| `ftb` | Fiber termination boxes |
| `fibre_optique` | Fiber-optic infrastructure |
| `pro` | Telecommunications infrastructure |
| `clients` | Client-related geographic data |

### 🖥️ WebGIS Features

The explored application included:

- Displaying and hiding geographic layers.
- Inspecting features and their attributes.
- Adding, editing and deleting geographic entities.
- Measuring distances on the map.
- Refreshing the map after data modifications.
- Visualizing telecommunications infrastructure interactively.

### 🔗 Geographic Web Services

| Standard | Purpose |
|---|---|
| WMS | Displaying map images |
| WFS | Accessing geographic features |
| WFS-T | Supporting geographic feature transactions |
| CSW | Catalog service for geographic metadata |
| ISO 19115 | Geographic metadata standard |

> **Scope clarification:** The local `telecom_sig` environment is a learning and demonstration setup. It should not be confused with Tunisie Telecom's production GIS infrastructure.

## 🧰 Technologies & Tools

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white" alt="PostgreSQL" />
  <img src="https://img.shields.io/badge/PostGIS-4169E1?style=flat-square&logo=postgresql&logoColor=white" alt="PostGIS" />
  <img src="https://img.shields.io/badge/QGIS-589632?style=flat-square&logo=qgis&logoColor=white" alt="QGIS" />
  <img src="https://img.shields.io/badge/GeoServer-4285F4?style=flat-square" alt="GeoServer" />
  <img src="https://img.shields.io/badge/GeoNetwork-39729B?style=flat-square" alt="GeoNetwork" />
  <img src="https://img.shields.io/badge/OpenLayers-1F6B75?style=flat-square" alt="OpenLayers" />
  <img src="https://img.shields.io/badge/pgAdmin-316192?style=flat-square" alt="pgAdmin" />
</p>

## 🎯 Skills Developed

- Understanding telecommunications access networks and optical infrastructure.
- Discovering GIS-based network representation and management.
- Exploring spatial database organization with PostgreSQL and PostGIS.
- Understanding geographic data publication through web services.
- Exploring interactive web mapping and geographic feature management.
- Learning how GIS technologies support telecommunications engineering.

## 📚 Report Structure

| Chapter | Main topics |
|---|---|
| **01** | Host organization and internship context |
| **02** | Telecommunications networks and infrastructure |
| **03** | GIS, spatial databases and WebGIS technologies |

## 🙏 Acknowledgements

I would like to thank **Tunisie Telecom**, the Regional Directorate of Mahdia, the professionals who supported me during this internship, and **ENIT** for the academic training that contributed to this experience.

---

<p align="center">
  <strong>Hanin EDHIB</strong>
  <br />
  ICT Engineering — Telecommunications
  <br />
  National Engineering School of Tunis (ENIT)
  <br /><br />
  <img src="https://img.shields.io/badge/MADE_IN-TUNISIA-red?style=flat-square" alt="Made in Tunisia" />
  <img src="https://img.shields.io/badge/YEAR-2026-003366?style=flat-square" alt="2026" />
</p>
