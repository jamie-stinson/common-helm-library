{{/*
Selector labels
*/}}
{{- define "common-helm-library.helpers.metadata.selector-labels" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
app.kubernetes.io/name: {{ required (printf $requiredMsg "name") $.Values.name | quote }}
app.kubernetes.io/instance: {{ $.Release.Name }}
{{- end -}}