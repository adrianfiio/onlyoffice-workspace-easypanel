# Changelog

All notable changes to this project will be documented in this file.

The format is based on **Keep a Changelog** and this project follows **Semantic Versioning (SemVer)**.

---

## [1.0.1] - 2026-07-21

### Added

- Added full EasyPanel deployment documentation.
- Added `TROUBLESHOOTING.md`.
- Added EasyPanel compatibility notes.
- Added Docker network alias for EasyPanel Traefik integration.
- Added deployment verification steps.
- Added diagnostic commands for Docker and Traefik.
- Added documentation for verifying Community Server, Document Server, MySQL and Elasticsearch.

### Changed

- Improved Docker Compose compatibility with EasyPanel.
- Improved deployment reliability.
- Updated project documentation.
- Improved service dependency handling.
- Improved installation instructions.

### Fixed

- Fixed **502 Service is not reachable** when deploying behind EasyPanel.
- Fixed Traefik backend hostname resolution.
- Fixed Community Server routing through EasyPanel reverse proxy.
- Fixed Docker network hostname resolution using network aliases.
- Fixed ONLYOFFICE Workspace accessibility over HTTPS.

---

## [1.0.0] - 2026-07-20

### Added

- Initial release.
- Docker Compose deployment.
- ONLYOFFICE Community Server.
- ONLYOFFICE Document Server.
- MySQL integration.
- Elasticsearch integration.
- JWT authentication.
- Persistent Docker volumes.
- Environment variable configuration.
- HTTPS support through EasyPanel.
