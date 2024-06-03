{{- define "common-helm-library.helpers.initContainers.main" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
{{- if .Values.initContainers }}
initContainers:
  {{- toYaml .Values.initContainers | nindent 4 }} 
{{- end }}
{{- end }}