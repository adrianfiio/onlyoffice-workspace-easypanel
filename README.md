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
