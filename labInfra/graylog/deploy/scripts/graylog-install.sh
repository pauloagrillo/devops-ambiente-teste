#!/usr/bin/env bash

set -euo pipefail
ROOT_DIR="$(git rev-parse --show-toplevel)/graylog"
source "$ROOT_DIR/.env"

helm upgrade --install graylog "${ROOT_DIR}/helm/graylog" \
    -n graylog \
    --set ingress.hosts[0].host="${GRAYLOG_HOST}" \
    --set graylog.httpExternalUri="https://${GRAYLOG_HOST}/"
