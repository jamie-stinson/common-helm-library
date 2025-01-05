{{- define "common-helm-library.helpers.workload.terminationGracePeriodSeconds" }}
{{- with .terminationGracePeriodSeconds }}
terminationGracePeriodSeconds: {{ . }}
{{- end }}
{{- end }}
