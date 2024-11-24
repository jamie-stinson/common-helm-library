{{- define "common-helm-library.helpers.workload.nodeselector" }}
{{- with .Values.workload.nodeSelector  }}
nodeSelector:
  {{- toYaml . | nindent 0 }}
{{- end }}
{{- end }}
