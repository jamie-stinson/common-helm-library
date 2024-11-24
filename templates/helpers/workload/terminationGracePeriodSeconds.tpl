{{- define "common-helm-library.helpers.workload.terminationgraceperiodseconds" }}
{{- if .Values.workload.terminationGracePeriodSeconds }}
terminationGracePeriodSeconds: {{ .Values.workload.terminationGracePeriodSeconds }}
{{- end }}
{{- end }}
