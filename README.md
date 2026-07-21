# ONLYOFFICE Workspace para EasyPanel

Pacote de implantação do ONLYOFFICE Workspace Community no EasyPanel.

## Componentes

- Community Server
- Document Server
- Control Panel
- Mail Server
- MySQL
- Elasticsearch

## Importante

A stack exige `privileged`, acesso a `/sys/fs/cgroup` e ao Docker Socket.
O EasyPanel precisa permitir esses recursos no serviço Compose.

O domínio deve apontar no EasyPanel para a porta interna/publicada `8080`.
O HTTPS externo pode ser fornecido pelo proxy do EasyPanel.

## Instalação

Leia `docs/INSTALACAO-EASYPANEL.md`.

## Origem

As imagens, versões e integrações seguem o Compose oficial do repositório
ONLYOFFICE/Docker-CommunityServer, com credenciais movidas para variáveis.


## EasyPanel Compatibility

When deploying ONLYOFFICE Workspace using EasyPanel, the generated Traefik configuration references the Community Server using the project-prefixed hostname:

```
sistemas_onlyoffice-server-work_onlyoffice-community-server
```

Docker Compose does not automatically create this alias.

To ensure Traefik can resolve the backend correctly, add:

```yaml
services:
  onlyoffice-community-server:
    networks:
      onlyoffice:
        aliases:
          - sistemas_onlyoffice-server-work_onlyoffice-community-server
```

Without this alias the browser will return:

```
502 Service is not reachable
```

while the container itself is healthy.

# ONLYOFFICE Workspace Docker

Current Version: **1.0.1**

Docker Compose deployment for ONLYOFFICE Workspace with EasyPanel compatibility.
