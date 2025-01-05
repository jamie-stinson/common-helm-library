{{- define "common-helm-library.helpers.workload.tolerations" }}
{{- with .tolerations }}
tolerations:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
