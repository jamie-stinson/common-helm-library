{{- define "common-helm-library.helpers.workload.tolerations" }}
{{- with .Values.workload.tolerations }}
tolerations:
  {{- toYaml . | nindent 0 }}
{{- end }}
{{- end }}
