{{- define "common-helm-library.resources.extraObjects" }}
{{ range .Values.extraObjects }}
{{ . }}
---
{{ end }}
{{- end }}
