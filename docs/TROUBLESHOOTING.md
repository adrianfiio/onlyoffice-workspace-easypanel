# Troubleshooting

This document contains the most common issues when deploying ONLYOFFICE Workspace using Docker Compose and EasyPanel.

---

# Table of Contents

- [502 Service is not reachable](#502-service-is-not-reachable)
- [Community Server does not start](#community-server-does-not-start)
- [Invalid CORE_MACHINE_KEY](#invalid-core_machine_key)
- [MySQL connection issues](#mysql-connection-issues)
- [Elasticsearch unhealthy](#elasticsearch-unhealthy)
- [Document Server connection issues](#document-server-connection-issues)
- [Useful diagnostic commands](#useful-diagnostic-commands)

---

# 502 Service is not reachable

## Symptoms

The browser displays:

```
502 Service is not reachable
```

or

```
Bad Gateway
```

Even though all containers are running.

---

## Cause

EasyPanel's Traefik generates the backend using the Docker Compose project name.

Example:

```
http://sistemas_onlyoffice-server-work_onlyoffice-community-server:80/
```

Docker Compose does not automatically create this hostname.

---

## Solution

Add a network alias to the Community Server.

```yaml
services:
  onlyoffice-community-server:
    networks:
      onlyoffice:
        aliases:
          - sistemas_onlyoffice-server-work_onlyoffice-community-server
```

Redeploy the stack.

---

## Verify

Run:

```bash
docker exec easypanel-traefik.1.xxxxxxxxx \
wget -S -O- http://sistemas_onlyoffice-server-work_onlyoffice-community-server:80/
```

Expected:

```
HTTP/1.1 302 Found
Location: /Wizard.aspx
```

Then verify externally:

```bash
curl -I https://your-domain.com
```

Expected:

```
HTTP/2 302
Location: /Wizard.aspx
```

---

# Community Server does not start

## Symptoms

Container continuously restarts.

```
Restarting (1)
```

or

```
Exited (1)
```

---

## Check logs

```bash
docker logs onlyoffice-community-server
```

---

## Possible causes

- Invalid Machine Key
- Database unavailable
- Elasticsearch unavailable
- Document Server unavailable

---

# Invalid CORE_MACHINE_KEY

## Symptoms

Logs show:

```
Invalid machine key
```

or

```
Unable to decrypt configuration
```

---

## Solution

Generate a new key.

Example:

```bash
openssl rand -hex 32
```

Update:

```
CORE_MACHINE_KEY=
```

Remove old volumes before redeploying.

---

# MySQL connection issues

Verify MySQL is healthy.

```bash
docker ps
```

Then:

```bash
docker exec onlyoffice-mysql-server mysqladmin ping
```

Expected:

```
mysqld is alive
```

---

# Elasticsearch unhealthy

Check health.

```bash
curl http://localhost:9200/_cluster/health
```

Expected:

```json
{
  "status":"green"
}
```

---

# Document Server connection issues

Verify:

```bash
curl http://onlyoffice-document-server/healthcheck
```

Expected:

```
true
```

---

# Useful diagnostic commands

## List containers

```bash
docker ps
```

---

## View logs

```bash
docker logs onlyoffice-community-server
```

---

## Check Docker network

```bash
docker network inspect onlyoffice
```

---

## Verify Community Server internally

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

## Verify Traefik connectivity

```bash
docker exec easypanel-traefik.1.xxxxx \
wget -S -O- http://sistemas_onlyoffice-server-work_onlyoffice-community-server:80/
```

---

## Verify public URL

```bash
curl -I https://your-domain.com
```

---

## Check generated Traefik configuration

```bash
docker exec easypanel-traefik.1.xxxxx \
grep -Rni "your-project-name" /data/config
```

---

# Recommended deployment order

Wait until the following services are healthy before accessing the portal:

1. MySQL
2. Elasticsearch
3. Document Server
4. Community Server

---

# Still having issues?

Collect the following information before opening an issue:

- Docker Compose file
- Environment variables (without secrets)
- Output of:

```bash
docker ps
docker logs onlyoffice-community-server
docker network inspect onlyoffice
curl -I https://your-domain.com
```

This information greatly speeds up troubleshooting.

## Editor apresenta "Erro ao baixar arquivo"

### Sintoma

O portal abre normalmente, mas ao abrir ou criar um documento o editor apresenta:

```text
Erro ao baixar arquivo
