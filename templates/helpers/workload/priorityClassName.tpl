{{- define "common-helm-library.helpers.workload.priorityclass" }}
{{- if .Values.workload.priorityClassName }}
priorityClassName: {{ .Values.workload.priorityClassName }}
{{- end }}
{{- end }}
