#/usr/bin/env bash

set -euo pipefail
helm repo add opensearch https://opensearch-project.github.io/helm-charts
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add fluent https://fluent.github.io/helm-charts
helm repo update