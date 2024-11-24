{{- define "common-helm-library.helpers.workload.args" }}
{{- if .Values.workload.args }}
args:
  {{- toYaml .Values.workload.args | nindent 2 }}
{{- end }}
{{- end }}
