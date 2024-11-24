{{/*
Global & Common Annotations
*/}}
{{- define "common-helm-library.helpers.metadata.annotations" }}
documentation: "example.com/docs"
owner: "engineering"
{{- if .Values.global.annotations }}
{{- toYaml .Values.global.annotations | nindent 0 }}
{{- end -}}
{{- end -}}
