#!/usr/bin/env bash
set -Eeuo pipefail

target="${1:-}"
case "$target" in
  n8n|baserow|tooljet|full) ;;
  *)
    printf 'Usage: bash scripts/end-tool.sh {n8n|baserow|tooljet|full}\n' >&2
    exit 64
    ;;
esac

case "$target" in
  n8n) docker compose stop n8n ;;
  baserow) docker compose stop baserow ;;
  tooljet) docker compose stop tooljet labs-postgres ;;
  full) docker compose stop ;;
esac
printf 'Stopped %s containers. Docker volumes and their data remain.\n' "$target"
