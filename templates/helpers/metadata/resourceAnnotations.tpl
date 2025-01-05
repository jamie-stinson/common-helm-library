{{- define "common-helm-library.helpers.metadata.resourceAnnotations" }}
{{- with .annotations }}
{{- toYaml . | nindent 0 }}
{{- end -}}
{{- end -}}
