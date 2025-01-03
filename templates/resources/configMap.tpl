{{- define "common-helm-library.resources.configMap" }}
{{- with .Values.configMap }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.labels" $ | indent 4 }}
    {{- if .labels }}
    {{- toYaml .labels | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.annotations" $ | indent 4 }}
    {{- if .annotations }}
    {{- toYaml .annotations | nindent 4 }}
    {{- end }}
data:
  {{- range $key, $value := .data }}
  {{ $key }}: |
    {{- $value | nindent 4 }}
  {{- end }}
---
{{- end }}
{{- end }}

