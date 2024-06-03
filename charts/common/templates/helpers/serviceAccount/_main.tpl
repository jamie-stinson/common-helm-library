{{- define "common-helm-library.helpers.serviceAccount.main" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
{{- if .Values.serviceAccount }}
serviceAccountName: {{ required (printf $requiredMsg "name") .Values.name | quote }}
{{- end }}
{{- end }}