{{- define "common-helm-library.helpers.workload.resources" }}
{{- with .resources }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
