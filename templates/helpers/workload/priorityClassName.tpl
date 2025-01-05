{{- define "common-helm-library.helpers.workload.priorityclass" }}
{{- with .priorityClassName }}
priorityClassName: {{ . }}
{{- end }}
{{- end }}
