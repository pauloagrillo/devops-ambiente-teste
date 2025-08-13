#!/usr/bin/env bash

set -euo pipefail
helm upgrade --install graylog-mongodb bitnami/mongodb \
 -n graylog -f "$(dirname "$0")/../mongodb/values.yaml"
