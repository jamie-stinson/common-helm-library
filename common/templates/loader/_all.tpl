{{/* Main entrypoint for the library */}}
{{- define "common-helm-library.loader.all" -}}

  {{- include "{{- define "common-helm-library.resources.deployment" -}}" . -}}

  {{- include "{{- define "common-helm-library.resources.serviceaccount" -}}" . -}}

{{- end -}}