#!/usr/bin/env bash
set -Eeuo pipefail

target="${1:-}"
case "$target" in
  n8n|baserow|tooljet|full) ;;
  *)
    printf 'Usage: bash scripts/start-tool.sh {n8n|baserow|tooljet|full}\n' >&2
    printf 'Use full only for an instructor-approved smoke test.\n' >&2
    exit 64
    ;;
esac

if [[ ! -f .env ]]; then
  printf 'Missing .env. Rebuild the Codespace or ask your instructor for help.\n' >&2
  exit 1
fi

case "$target" in
  n8n) docker compose up -d --wait n8n ;;
  baserow) docker compose up -d --wait baserow ;;
  tooljet) docker compose up -d --wait tooljet labs-postgres ;;
  full) docker compose up -d --wait ;;
esac

docker compose ps

case "$target" in
  n8n) printf '\nn8n started. Open the private forwarded port 5678.\n' ;;
  baserow) printf '\nBaserow started. Open the private forwarded port 8080.\n' ;;
  tooljet) printf '\nToolJet and labs-postgres started. Open the private forwarded port 3000.\n' ;;
  full) printf '\nAll course services started. Stop unused services promptly.\n' ;;
esac
