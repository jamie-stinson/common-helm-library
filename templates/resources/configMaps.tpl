{{- define "common-helm-library.resources.configMaps" }}
{{- range .Values.configMaps }}
{{- if .enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ $.Release.Name }}-{{ .name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.labels" . | indent 4 }}
    {{- if .labels }}
    {{- toYaml .labels | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.annotations" . | indent 4 }}
    {{- if .annotations }}
    {{- toYaml .annotations | nindent 4 }}
    {{- end }}
data:
  {{- range $key, $value := .data }}
  {{ $key }}: |
    {{ $value | nindent 4 }}
  {{- end }}
{{- end }}
---
{{- end }}
{{- end }}

