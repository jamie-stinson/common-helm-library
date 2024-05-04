{{/*
A default message string to be used when checking for a required value
*/}}

{{- define "common-helm-library.helpers.check-required-value" -}}
{{- "No value found for '%s' in common-helm-library template" -}}
{{- end -}}