{{- define "common-helm-library.helpers.workload.topologySpreadConstraints" }}
{{- with .topologySpreadConstraints }}
topologySpreadConstraints:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
