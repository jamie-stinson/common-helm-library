{{- define "common-helm-library.helpers.metadata.resourceLabels" }}
{{- with .labels }}
{{- toYaml . | nindent 0 }}
{{- end -}}
{{- end -}}
