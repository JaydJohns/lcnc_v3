#!/usr/bin/env bash
set -Eeuo pipefail

# Run this inside the started Codespace, not during a Codespaces prebuild.
if [[ ! -f .env ]]; then
  umask 077
  password="$(openssl rand -hex 18)"
  printf 'LABS_POSTGRES_PASSWORD=%s\n' "$password" > .env
  unset password
  printf 'Created private .env with a generated PostgreSQL password.\n'
fi

docker version --format '{{.Server.Version}}' >/dev/null
printf '\nCodespaces setup is ready. Choose only the week profile you need:\n'
printf '  bash scripts/start-tool.sh n8n\n'
printf '  bash scripts/start-tool.sh baserow\n'
printf '  bash scripts/start-tool.sh tooljet\n'
