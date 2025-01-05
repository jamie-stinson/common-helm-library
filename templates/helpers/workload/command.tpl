{{- define "common-helm-library.helpers.workload.command" }}
{{- with .command }}  
command:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
