{{- define "common-helm-library.helpers.horizontalPodAutoscaler.behaviour" }}
{{- with .behavior }}
behavior:
{{- toYaml . | nindent 4 }}
{{- end }}
{{- end }}
