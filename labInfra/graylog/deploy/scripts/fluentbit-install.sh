#!/usr/bin/env bash

set -euo pipefail
helm upgrade --install fluent-bit fluent/fluent-bit \
    -n graylog \
    --set tolerations[0].operator=Exists \
    --set volumes[0].name=varlog --set volumes[0].hostPath.path=/var/log \
    --set volumes[1].name=containers --set volumes[1].hostPath.path=/var/log/containers \
    --set volumes[2].name=pods --set volumes[2].hostPath.path=/var/log/pods \
    --set volumeMounts[0].name=varlog --set volumeMounts[0].mountPath=/var/log \
    --set volumeMounts[1].name=containers --set volumeMounts[1].mountPath=/var/log/containers \
    --set volumeMounts[2].name=pods --set volumeMounts[2].mountPath=/var/log/pods \
    --set config.outputs="[OUTPUT]\n Name gelf\n Match kube.*\n Host graylog.graylog.svc.cluster.local\n Port 12201\n Mode udp\n" \
    --set config.service="[SERVICE]\n Parsers_File parsers.conf\n" \
    --set config.inputs="[INPUT]\n Name tail\n Path /var/log/containers/*.log\n Tag kube.*\n Parser cri\n Mem_Buf_Limit 10MB\n    Skip_Long_Lines On\n" \
    --set config.filters="[FILTER]\n Name kubernetes\n Match kube.*\n Merge_Log On\n Kube_Tag_Prefix kube.var.log.containers.\n"

