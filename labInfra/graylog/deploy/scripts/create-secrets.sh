#!/usr/bin/env bash

set -euo pipefail
ROOT_DIR="$(git rev-parse --show-toplevel)/graylog"
source "$ROOT_DIR/.env"

# OpenSearch credentials
kubectl -n graylog delete secret opensearch-admin --ignore-not-found
kubectl create secret generic opensearch-admin \
  --from-literal=password="$OPENSEARCH_ADMIN_PASS"

# Mongo auth

kubectl -n graylog delete secret mongo-auth --ignore-not-found
kubectl -n graylog create secret generic mongo-auth \
  --from-literal=root-password="$MONGO_ROOT_PASS" \
  --from-literal=app-user="$MONGO_APP_USER" \
  --from-literal=password="$MONGO_APP_PASS"

# Graylog secrets

kubectl -n graylog delete secret graylog-secrets --ignore-not-found
kubectl -n graylog create secret generic graylog-secrets \
  --from-literal=PASSWORD_SECRET="$GRAYLOG_PASSWORD_SECRET" \
  --from-literal=ROOT_SHA256="$GRAYLOG_ROOT_PASSWORD_SHA2" 

