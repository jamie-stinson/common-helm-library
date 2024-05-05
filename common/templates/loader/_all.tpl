{{/* Main entrypoint for the library */}}
{{- define "common-helm-library.loader.all" -}}

{{- include "common-helm-library.resources.deployment" . }}

{{- include "common-helm-library.resources.serviceaccount" . }}

{{- end }}