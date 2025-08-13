{{- define "graylog.name" -}}
{{- default .Chart.Name ,Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "graylog.fullname" -}}
{{- include "graylog.name" . }}-{{ .Release.Name }}
{{- end -}}