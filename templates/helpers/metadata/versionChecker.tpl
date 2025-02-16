{{- define "common-helm-library.helpers.metadata.versionChecker" }}
{{- if .Values.versionChecker.imageOverride }}
override-url.version-checker.io/{{ .Release.Name }}: {{ .Values.workload.image.registry }}/{{ .Values.workload.image.repository }}
{{- end }}
{{- end }}
