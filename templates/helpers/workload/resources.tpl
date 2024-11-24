{{- define "common-helm-library.helpers.workload.resources" }}
{{- if .Values.workload.resources }}
resources:
  {{- toYaml .Values.workload.resources | nindent 2 }}
{{- end }}
{{- end }}
