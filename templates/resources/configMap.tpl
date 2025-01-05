{{- define "common-helm-library.resources.configMap" }}
{{- if .Values.configMap.enabled }}
{{- with .Values.configMap }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
{{- with .data }}
data:
  {{- range $key, $value := . }}
  {{- $key | nindent 2 }}: |
    {{- $value | nindent 4 }}
  {{- end }}
{{- end }}
---
{{- end }}
{{- end }}
{{- end }}
