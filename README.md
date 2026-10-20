<div align="center">

# 📡 Telecommunications Access Networks, GIS & WebGIS

### Engineering Internship Report — Tunisie Telecom, Regional Directorate of Mahdia

<img src="https://img.shields.io/badge/TUNISIE_TELECOM-Internship_Report-E53935?style=for-the-badge" alt="Tunisie Telecom" />
<img src="https://img.shields.io/badge/ENIT-2025--2026-003366?style=for-the-badge" alt="ENIT 2025-2026" />
<img src="https://img.shields.io/badge/Duration-July_2026-6B7280?style=for-the-badge" alt="July 2026" />

<img src="https://img.shields.io/badge/Telecom-Access_Networks-2563EB?style=flat-square" alt="Access networks" />
<img src="https://img.shields.io/badge/GIS-Spatial_Data-16A34A?style=flat-square" alt="GIS" />
<img src="https://img.shields.io/badge/WebGIS-OpenLayers-7C3AED?style=flat-square" alt="WebGIS" />
<img src="https://img.shields.io/badge/Language-French-0EA5E9?style=flat-square" alt="Report language: French" />

<br /><br />

<a href="./Internship_Report_Tunisie_Telecom.pdf">
  <img src="https://img.shields.io/badge/📄_READ_THE_FULL_REPORT-PDF-DC2626?style=for-the-badge&logo=adobeacrobatreader&logoColor=white" alt="Read the full report (PDF)" />
</a>

<sub>The report is written in French · 31 pages · 3 chapters</sub>

</div>

---

## 🧾 About the Internship

| | |
|---|---|
| 🏢 **Host organization** | Tunisie Telecom |
| 📍 **Location** | Regional Directorate of Mahdia, Tunisia |
| 🗺️ **Department** | Geographic Information Systems (GIS) service |
| 🎓 **Institution** | National Engineering School of Tunis (ENIT) — ICT Department |
| 👩‍💻 **Intern** | Hanin EDHIB — Class 1 TEL 1 |
| 👨‍🏫 **Supervisor** | Mr. Mohamed NEGZAOUI |
| 📅 **Period** | July 1 – July 31, 2026 |
| 📘 **Type** | First-year engineering internship (*stage ouvrier*) |

## 🔎 Summary

This one-month internship took place in the GIS service of Tunisie Telecom's Regional Directorate of Mahdia. It combined three activities:

1. **Field observation** of the access network (copper, GPON and AirPON equipment) with the deployment team.
2. **Contribution to the regional GIS** by entering network equipment from technical plans.
3. **A self-built local GIS/WebGIS environment** that reproduces the architecture of a complete GIS stack, from spatial database to web map.

The local environment was built to understand each stage of geographic data management, since access to the production system is restricted for confidentiality reasons.

## 📚 Report Content

| # | Chapter | What it covers |
|:-:|---|---|
| **1** | **Host organization and internship context** | Tunisie Telecom, the Regional Directorate of Mahdia, the GIS service, its missions, data workflow and technical environment |
| **2** | **Access network analysis in a GIS environment** | Evolution from copper to fiber, field equipment, and how copper, GPON and AirPON networks are represented in the GIS |
| **3** | **Building a GIS/WebGIS environment** | Contribution to the regional GIS, then design and implementation of a local PostGIS, GeoServer, QGIS, GeoNetwork and OpenLayers stack |

### 🌐 Access network technologies studied

| Technology | Principle | Observed in the field |
|---|---|:-:|
| **Copper (ADSL / VDSL)** | Tree architecture from the main distribution frame to the subscriber | ✅ |
| **FTTH P2P** | One dedicated fiber per subscriber from the NRO | — |
| **GPON** | One fiber shared among subscribers through passive optical splitters | ✅ |
| **AirPON** | GPON-based deployment using cascaded Hub-Box, Sub-Box and End-Box enclosures, mostly on poles | ✅ |

### 🧱 Network equipment covered

| Equipment | Role |
|---|---|
| **IPMSAN** | Active access node for the copper network (telephony and broadband) |
| **PC** | Concentration point: last distribution level before copper subscribers |
| **OLT** | Active optical equipment that emits the signal, located at the central office |
| **NRO** | Optical connection node housing OLTs and patch panels |
| **SRO** | Optical sub-distribution cabinet, generally hosting splitters |
| **PBO / FAT** | Last optical connection point before the subscriber, contains a splice cassette |
| **Hub-Box / Sub-Box / End-Box** | Three-level AirPON distribution hierarchy |
| **Pull chambers** | Underground chambers shared by copper and fiber cables |

## 🗺️ Local GIS/WebGIS Environment

### Architecture

```mermaid
flowchart LR
    Q["🖥️ QGIS<br/>Digitizing & validation"] -->|create / update| DB[("🗄️ PostgreSQL + PostGIS<br/>telecom_sig")]
    PG["pgAdmin<br/>Administration"] -.->|manage| DB
    DB -->|spatial data| GS["🌍 GeoServer<br/>WMS · WFS · WFS-T"]
    GS -->|metadata from WMS| GN["📚 GeoNetwork<br/>ISO 19115 · CSW"]
    GS -->|OGC services| OL["🧭 OpenLayers<br/>WebGIS application"]
    OL --> U(["👤 Users"])
```

### Data model

The database mirrors the hierarchical organization of the fiber network observed at Tunisie Telecom.

```mermaid
flowchart TD
    C["Optical central office / OLT"] --> T["Transport cables"]
    T --> D["Distribution (SRO)"]
    D --> F["FTB"]
    F --> CL["Clients"]
```

| Table | Content |
|---|---|
| `centrale_optique` | Optical central offices |
| `olt` | Optical Line Terminals |
| `sro` | Optical sub-distribution cabinets |
| `ftb` | Fiber termination boxes |
| `fibre_optique` | Fiber-optic cables (transport and distribution) |
| `pro` | Connection points |
| `clients` | Client locations |

### WebGIS features

- 🗂️ Display and toggle of geographic layers
- 🔍 Inspection of feature attributes by clicking on the map
- ✏️ Add, edit and delete features (via WFS-T)
- 📏 Distance measurement on the map
- 🔄 Automatic refresh after each modification

### OGC and ISO standards used

| Standard | Purpose |
|---|---|
| **WMS** | Serves maps as georeferenced images |
| **WFS** | Gives access to vector features and their attributes |
| **WFS-T** | Allows feature creation, update and deletion |
| **CSW** | Search and retrieval of metadata in a catalog |
| **ISO 19115** | Standard describing geographic resources |

## 🧰 Technologies

<div align="center">

<img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL" />
<img src="https://img.shields.io/badge/PostGIS-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostGIS" />
<img src="https://img.shields.io/badge/QGIS-589632?style=for-the-badge&logo=qgis&logoColor=white" alt="QGIS" />
<img src="https://img.shields.io/badge/GeoServer-4285F4?style=for-the-badge" alt="GeoServer" />
<img src="https://img.shields.io/badge/GeoNetwork-39729B?style=for-the-badge" alt="GeoNetwork" />
<img src="https://img.shields.io/badge/OpenLayers-1F6B75?style=for-the-badge" alt="OpenLayers" />
<img src="https://img.shields.io/badge/pgAdmin-316192?style=for-the-badge" alt="pgAdmin" />
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript" />
<img src="https://img.shields.io/badge/HTML%2FCSS-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML/CSS" />

</div>

## 🎯 Skills Developed

| Domain | Skills |
|---|---|
| 📡 **Telecom networks** | Copper and FTTx access architectures, optical distribution equipment, field observation |
| 🗺️ **GIS** | Network representation, technical plan integration, attribute entry, data quality |
| 🗄️ **Spatial databases** | PostgreSQL/PostGIS modeling, spatial tables, administration with pgAdmin |
| 🌍 **Geospatial services** | Publishing OGC services (WMS/WFS) and documenting data with metadata |
| 🖥️ **Web mapping** | Interactive map development with OpenLayers |
| 🤝 **Professional** | Rigor, autonomy, teamwork, respect of company procedures |

## 🔒 Scope & Confidentiality

> [!IMPORTANT]
> - The `telecom_sig` environment is a **learning and demonstration setup**. It is **not** Tunisie Telecom's production GIS infrastructure.
> - The data used in the local environment is for demonstration purposes only. No confidential network data is published in this repository.
> - Tunisie Telecom's production system is based on ArcGIS Enterprise. The local stack uses open-source tools.

## 👩‍💻 Author

<div align="center">

**Hanin EDHIB**
ICT Engineering student — Telecommunications
National Engineering School of Tunis (ENIT), University of Tunis El Manar

🙏 *Thanks to Mr. Mohamed Negzaoui, the Tunisie Telecom team in Mahdia, and ENIT for their guidance and support.*

<img src="https://img.shields.io/badge/Made_in-Tunisia-E70013?style=flat-square" alt="Made in Tunisia" />
<img src="https://img.shields.io/badge/Year-2026-003366?style=flat-square" alt="2026" />

</div>
