# ONLYOFFICE Workspace for EasyPanel

> Complete Docker Compose deployment of **ONLYOFFICE Workspace Community Edition**, optimized and tested for **EasyPanel**.

![Version](https://img.shields.io/badge/version-1.0.1-blue)
![Docker](https://img.shields.io/badge/docker-ready-2496ED?logo=docker&logoColor=white)
![EasyPanel](https://img.shields.io/badge/EasyPanel-Compatible-success)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 📖 Overview

This project provides an easy and reliable way to deploy **ONLYOFFICE Workspace Community Edition** using **Docker Compose** with full compatibility for **EasyPanel**.

The stack includes:

- ONLYOFFICE Community Server
- ONLYOFFICE Document Server
- MySQL 5.7
- Elasticsearch
- JWT Authentication
- Persistent Docker Volumes
- EasyPanel Traefik Compatibility
- Automatic Health Checks

---

## ✨ Features

- ✅ EasyPanel Ready
- ✅ Docker Compose
- ✅ HTTPS Support
- ✅ Traefik Compatible
- ✅ JWT Authentication
- ✅ MySQL 5.7
- ✅ Elasticsearch
- ✅ Persistent Data
- ✅ Automatic Health Checks
- ✅ Production Ready
- ✅ Community Edition

---

# Architecture

```
                    Internet
                        │
                        ▼
              EasyPanel / Traefik
                        │
                        ▼
          ONLYOFFICE Community Server
                        │
        ┌───────────────┴───────────────┐
        │                               │
        ▼                               ▼
Document Server                    MySQL 5.7
                                        │
                                        ▼
                                Elasticsearch
```

---

# Requirements

See:

```
docs/REQUISITOS.md
```

---

# Installation

Follow the installation guide:

```
docs/INSTALACAO-EASYPANEL.md
```

---

# Configuration

Copy the example environment file:

```bash
cp .env.example .env
```

Edit:

```env
MYSQL_ROOT_PASSWORD=

MYSQL_DATABASE=

MYSQL_USER=

MYSQL_PASSWORD=

JWT_SECRET=

CORE_MACHINE_KEY=

TZ=
```

---

# Deployment

```bash
docker compose up -d
```

---

# Verify Installation

Community Server

```bash
docker exec onlyoffice-community-server \
curl -I http://127.0.0.1/
```

Expected:

```
HTTP/1.1 302 Found
Location: /Wizard.aspx
```

---

Public URL

```bash
curl -I https://your-domain.com
```

Expected:

```
HTTP/2 302
Location: /Wizard.aspx
```

---

# Screenshots

Add screenshots inside:

```
screenshots/
```

Example:

```
screenshots/

dashboard.png

documents.png

mail.png

crm.png

calendar.png
```

---

# Troubleshooting

If you encounter any issue:

```
docs/TROUBLESHOOTING.md
```

Common problems:

- 502 Service is not reachable
- Invalid CORE_MACHINE_KEY
- MySQL connection
- Elasticsearch
- Document Server
- Community Server
- EasyPanel Traefik

---

# Updating

See:

```
docs/UPDATE.md
```

---

# Backup

See:

```
docs/BACKUP.md
```

---

# Version

Current Version

```
1.0.1
```

---

# Project Structure

```
.
├── config/
│   └── mysql/
│       └── conf.d/
│           └── onlyoffice.cnf
│
├── docs/
│   ├── INSTALACAO-EASYPANEL.md
│   ├── REQUISITOS.md
│   ├── TROUBLESHOOTING.md
│   ├── BACKUP.md
│   ├── UPDATE.md
│   ├── FAQ.md
│
├── scripts/
│   └── check-host.sh
│
├── screenshots/
│
├── .env.example
├── .gitignore
├── CHANGELOG.md
├── LICENSE
├── README.md
├── VERSION
└── docker-compose.yml
```

---

# Documentation

| Document | Description |
|----------|-------------|
| README.md | Project overview |
| REQUISITOS.md | Minimum requirements |
| INSTALACAO-EASYPANEL.md | Installation guide |
| TROUBLESHOOTING.md | Troubleshooting |
| BACKUP.md | Backup guide |
| UPDATE.md | Update guide |
| CHANGELOG.md | Release history |

---

# Changelog

See:

```
CHANGELOG.md
```

---

# License

This project is licensed under the MIT License.

See:

```
LICENSE
```

---

# Credits

This project was created to simplify the deployment of **ONLYOFFICE Workspace Community Edition** using Docker Compose and EasyPanel.

The deployment was validated through real-world testing, including:

- EasyPanel integration
- Traefik reverse proxy
- HTTPS routing
- Docker networking
- Community Server
- Document Server
- Elasticsearch
- MySQL
- JWT Authentication

A specific compatibility issue with EasyPanel's Traefik hostname resolution was identified and resolved by introducing a Docker network alias, ensuring reliable routing and stable deployments.

---

# Contributing

Pull Requests are welcome.

If you find a bug or have a suggestion, feel free to open an Issue or submit a Pull Request.

---

⭐ If this project helped you, consider giving it a Star on GitHub!
