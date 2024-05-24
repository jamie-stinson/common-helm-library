{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "common-helm-library.loader.all" -}}
  {{- /* Build the templates */ -}}
  {{- include "common-helm-library.resources.deployment" . | nindent 0 -}}
  {{- include "common-helm-library.resources.daemonset" . | nindent 0 -}}
  {{- include "common-helm-library.resources.statefulset" . | nindent 0 -}}
  {{- include "common-helm-library.resources.ingressroute" . | nindent 0 -}}  
  {{- include "common-helm-library.resources.serviceaccount" . | nindent 0 -}}
  {{- include "common-helm-library.resources.service" . | nindent 0 -}}
  {{- include "common-helm-library.resources.configmap" . | nindent 0 -}}
  {{- include "common-helm-library.resources.persistentvolumeclaim" . | nindent 0 -}}
  {{- include "common-helm-library.resources.persistentvolume" . | nindent 0 -}}
  {{- include "common-helm-library.resources.role" . | nindent 0 -}}
  {{- include "common-helm-library.resources.rolebinding" . | nindent 0 -}}
  {{- include "common-helm-library.resources.storageClass" . | nindent 0 -}}  
{{- end -}}

