# Course Stack — Setup Record and Daily Use

## GitHub Codespaces requirement

Use GitHub Codespaces only if your instructor has approved it as your course-stack path. When creating the Codespace, select this machine type:

```text
4-core · 16 GB RAM · 32 GB storage
```

The 2-core machine may work for a short n8n-only task, but it is not the supported option for Baserow, ToolJet, or the full course stack.

## Start only the tool you need

Use the commands for the environment you are working in. Do not start the full stack unless your instructor asks you to do so.

### Local Docker Desktop

Run these commands from the folder that contains `docker-compose.yml`.

| If you need | Run |
|---|---|
| n8n | `docker compose up -d n8n` |
| Baserow | `docker compose up -d baserow` |
| ToolJet and its course PostgreSQL database | `docker compose up -d tooljet labs-postgres` |
| Check what is running | `docker compose ps` |

### Approved GitHub Codespaces fallback

On your first Codespaces session, run:

```bash
bash scripts/initialize-codespace.sh
```

Then start only the tool needed for the current activity:

| If you need | Run |
|---|---|
| n8n | `bash scripts/start-tool.sh n8n` |
| Baserow | `bash scripts/start-tool.sh baserow` |
| ToolJet and its course PostgreSQL database | `bash scripts/start-tool.sh tooljet` |
| Check what is running | `bash scripts/status.sh` |

### Why PostgreSQL starts only with ToolJet

The course database is the `labs-postgres` container. It is used for the ToolJet dashboard activities, so the ToolJet command starts both containers together:

```text
tooljet + labs-postgres
```

The n8n and Baserow commands do not name `labs-postgres`, so they do not start it. This conserves Codespaces memory and CPU when a database is not needed. When you run `bash scripts/end-tool.sh tooljet`, the script stops both ToolJet and `labs-postgres` while keeping their Docker volumes and course data.

ToolJet's own internal setup database is separate from `labs-postgres`. In the Week 5 ToolJet data source, use `labs-postgres` as the host and `5432` as the port; do not forward PostgreSQL through Codespaces.

In Codespaces, open the appropriate **Private** forwarded port from the **PORTS** panel: ToolJet `3000`, n8n `5678`, or Baserow `8080`. Do not forward PostgreSQL.

When you finish, stop the tool without deleting its data:

| Tool you started | Run |
|---|---|
| n8n | `bash scripts/end-tool.sh n8n` |
| Baserow | `bash scripts/end-tool.sh baserow` |
| ToolJet and its course PostgreSQL database | `bash scripts/end-tool.sh tooljet` |

Do not run `docker compose down -v` unless your instructor explicitly directs you to reset your data.

## Environment
- Date:
- Operating system and version:
- Docker Desktop version:
- Git commit hash for this setup:

## Service verification
| Service | Endpoint or command | Result | Evidence filename or safe note |
|---|---|---|---|
| Baserow | http://localhost:8080 |  |  |
| n8n | http://localhost:5678 |  |  |
| ToolJet | http://localhost:3000 |  |  |
| labs Postgres | `docker compose exec labs-postgres psql -U student -d labs -c "SELECT version();"` |  |  |

## Local changes and troubleshooting
- Port changes made, if any:
- Problem encountered:
- Diagnostic command used:
- Resolution or current next step:

## Security check
- `.env` is ignored and was not committed: yes / no
- Screenshots and documentation were reviewed for secrets: yes / no
