{{- define "common-helm-library.resources.extraObjects" }}
{{ range .Values.extraObjects }}
---
{{ tpl . $ }}
{{ end }}
{{- end }}
