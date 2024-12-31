{{- define "common-helm-library.helpers.workload.affinity" }}
{{- with .Values.workload.affinity }}
affinity:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
