{{- define "common-helm-library.helpers.metadata.commonAnnotations" }}
app.kubernetes.io/name: {{ .Release.Name }}
{{- if .Values.versionChecker.imageOverride }}
override-url.version-checker.io/{{ .Release.Name }}: {{ .Values.workload.image.registry }}/{{ .Values.workload.image.repository }}
{{- end }}
{{- with .Values.global.annotations }}
{{- toYaml . | nindent 0 }}
{{- end }}
{{- end }}
