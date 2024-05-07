{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "common-helm-library.loader.all" -}}
  {{- /* Import values */ -}}
  {{- include "common-helm-library.helpers.chart.merge-values" . -}}

  {{- /* Build the templates */ -}}
  {{- include "common-helm-library.resources.deployment" . | nindent 0 -}}
  {{- include "common-helm-library.resources.serviceaccount" . | nindent 0 -}}
  {{- include "common-helm-library.resources.service" . | nindent 0 -}}
  {{- include "common-helm-library.resources.configmap" . | nindent 0 -}}
  {{- include "common-helm-library.resources.persistentvolumeclaim" . | nindent 0 -}}
  {{- include "common-helm-library.resources.role" . | nindent 0 -}}
  {{- include "common-helm-library.resources.rolebinding" . | nindent 0 -}}
{{- end -}}
