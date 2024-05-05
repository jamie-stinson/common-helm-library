{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}

{{- define "common-helm-library.loader.all" -}}
  {{- /* Generate remaining objects */ -}}
  {{- include "common-helm-library.loader.generate" . -}}
{{- end -}}