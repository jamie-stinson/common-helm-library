{{- define "common-helm-library.helpers.metadata.commonSelectorLabels" }}
app.kubernetes.io/name: {{ .Release.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
