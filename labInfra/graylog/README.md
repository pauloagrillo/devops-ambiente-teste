# Stack Graylog (lab) - RKE2 + Longhorn + trefik

Componentes:
- OpenSearch 2.x (Helm, single-node)
- MongoDB 6.x (Helm, replicaset com 1 réplica)
- Graylog 5.x (Helm chart próprio)
- (opciona) FluentBit mandando GELF UDP

## Passoa a passo
1. `cp .env.example .env` e edite senhas/host
2. `deploy/scripts/setup´-repos.sh`
3. `deploy/scripts/create-namespace.sh`
4. `deploy/scripts/create-secrets.sh`
5. `deploy/scripts/opensearch-install.sh`
6. `deploy/scripts/mongodb-install.sh`
7. `deploy/scripts/graylog-install.sh`
8. `deploy/scripts/graylog-install.sh`
9. Acesse https://$GRAYLOG_HOST/ e crie Input GELF UDP

## Observações
- Use `GRAYLOG_HTTP_EXTERNAL_URI` **sem** sufixo de path e com `/` final
- Services esperados:
    - Opensearch: `opensearch-cluster-master.graylog.svc:9200`
    - MongoDB: `graylog-mongodb.graylog.svc:27017`
    - Graylog: `graylog-<release>.graylog.svc`
