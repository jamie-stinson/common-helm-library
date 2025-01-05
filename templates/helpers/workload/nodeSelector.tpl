{{- define "common-helm-library.helpers.workload.nodeselector" }}
{{- with .nodeSelector  }}
nodeSelector:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
