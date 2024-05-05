{{/*
Common labels
*/}}
{{- define "common-helm-library.helpers.metadata.labels" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
app.kubernetes.io/name: {{ required (printf $requiredMsg "name") .Values.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}