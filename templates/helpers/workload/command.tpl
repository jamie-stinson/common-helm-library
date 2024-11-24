{{- define "common-helm-library.helpers.workload.command" }}
{{- if .Values.workload.command }}  
command:
  {{- toYaml .Values.workload.command | nindent 2 }}
{{- end }}
{{- end }}
