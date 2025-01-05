{{- define "common-helm-library.helpers.workload.affinity" }}
{{- with .affinity }}
affinity:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
