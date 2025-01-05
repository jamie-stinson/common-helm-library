{{- define "common-helm-library.helpers.workload.args" }}
{{- with .args }}
args:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
