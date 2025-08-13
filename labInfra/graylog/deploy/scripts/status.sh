#!/usr/bin/env bash

set -euo pipefail

kubectl -n graylog get pods -o wide
kubectl -n graylog get svc -o wide
kubectl -n graylog get get ingress