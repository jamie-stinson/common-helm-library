{{- define "common-helm-library.helpers.metadata.commonAnnotations" }}
app.kubernetes.io/name: {{ .Release.Name }}
{{- with .Values.global.annotations }}
{{- toYaml . | nindent 0 }}
{{- end }}
{{- end }}
