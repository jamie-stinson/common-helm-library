{{- define "common-helm-library.helpers.priorityclass.main" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
{{- if .Values.priorityClassName }}
priorityClassName: {{ .Values.priorityClassName }}
{{- end }}
{{- end }}