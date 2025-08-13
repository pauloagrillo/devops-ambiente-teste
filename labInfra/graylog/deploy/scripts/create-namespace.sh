#!/usr/bin/env bash

set -euo pipefail
kubectl apply -f "$(dirname "$0")/../namespace.yaml"