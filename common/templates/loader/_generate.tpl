{{/*
Secondary entrypoint and primary loader for the common chart
*/}}

{{- define "common-helm-library.loader.generate" -}}

  {{- /* Build the templates */ -}}
  {{- include "common-helm-library.resources.deployment" . | nindent 0 -}}
  {{- include "common-helm-library.resources.serviceaccount" . | nindent 0 -}}

{{- end -}}