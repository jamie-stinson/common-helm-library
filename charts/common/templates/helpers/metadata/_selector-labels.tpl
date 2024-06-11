{{/*
Common Selector labels
*/}}
{{- define "common-helm-library.helpers.metadata.selector-labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}