{{/*
Global & Common Annotations
*/}}
{{- define "common-helm-library.helpers.metadata.annotations" }}
app.kubernetes.io/name: {{ .Release.Name }}
{{- if .Values.global.annotations }}
{{- toYaml .Values.global.annotations | nindent 0 }}
{{- end -}}
{{- end -}}
