#!/usr/bin/env bash
set -Eeuo pipefail

docker compose ps
printf '\nOpen only the private Codespaces port for a service you have started.\n'
