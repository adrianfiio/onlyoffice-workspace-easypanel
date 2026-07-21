# Instalação no EasyPanel

## 1. GitHub

Extraia o ZIP e envie **o conteúdo interno** para a raiz do repositório.
Não envie a pasta externa inteira, para não criar uma pasta duplicada.

## 2. Criar projeto

No EasyPanel:

1. Crie um projeto chamado `onlyoffice`.
2. Adicione um serviço do tipo `Compose`.
3. Cole o conteúdo de `docker-compose.yml`.

## 3. Variáveis

Copie todas as variáveis de `.env.example` para a área Environment do Compose.
Troque obrigatoriamente todas as senhas e chaves.

Para gerar segredos no Linux:

```bash
openssl rand -hex 32
```

## 4. Domínio

Crie um domínio no EasyPanel apontando para o serviço do Community Server e
para a porta `8080`.

Exemplo:

```text
office.seudominio.com -> 8080
```

## 5. Deploy

Faça o deploy e acompanhe primeiro:

- `onlyoffice-mysql-server`
- `onlyoffice-elasticsearch`
- `onlyoffice-document-server`
- `onlyoffice-mail-server`
- `onlyoffice-community-server`
- `onlyoffice-control-panel`

A primeira inicialização pode demorar vários minutos.

## 6. Primeiro acesso

Abra o domínio e cadastre o administrador do portal.

## Limitações importantes

- As portas 25, 143 e 587 podem estar bloqueadas pelo provedor.
- Mail exige DNS correto, PTR/reverso e boa reputação do IP.
- O Control Panel acessa `/var/run/docker.sock`, o que possui alto privilégio.
- Caso o EasyPanel bloqueie `privileged`, `cgroup: host` ou mounts do host,
  o Workspace completo não iniciará corretamente.
