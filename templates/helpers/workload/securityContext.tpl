{{- define "common-helm-library.helpers.workload.securityContext" }}
{{- with .Values.workload.securityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
