{{- define "common-helm-library.resources.configMap" }}
{{- if .Values.configMap.enabled }}
{{- with .Values.configMap }}
{{- range .configMaps }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
{{- with .data }}
data:
  {{- range $key, $value := . }}
    {{- $stringValue := $value | toString }}
    {{- if contains "\n" $stringValue }}
  {{ $key }}: |
    {{- $stringValue | nindent 4 }}
    {{- else }}
  {{ $key }}: {{ $stringValue | quote }}
    {{- end }}
  {{- end }}
{{- end }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}
