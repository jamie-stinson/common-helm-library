{{- define "common-helm-library.helpers.workload.affinity" }}
{{- with .Values.workload.affinity }}
affinity:
  {{- toYaml . | nindent 0 }}
{{- end }}
{{- end }}
