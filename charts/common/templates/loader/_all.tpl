{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "common-helm-library.loader.all" -}}
  {{- /* Build templates */ -}}
  {{- include "common-helm-library.resources.workload" . }}
  {{- include "common-helm-library.resources.ingressroute" . }}
  {{- include "common-helm-library.resources.service" . }}
  {{- include "common-helm-library.resources.serviceaccount" . }}
  {{- include "common-helm-library.resources.configmap" . }}
  {{- include "common-helm-library.resources.persistentvolume" . }}
  {{- include "common-helm-library.resources.persistentvolumeclaim" . }}
  {{- include "common-helm-library.resources.role" . }}
  {{- include "common-helm-library.resources.rolebinding" . }}
  {{- include "common-helm-library.resources.storageClass" . }}
  {{- include "common-helm-library.resources.certificate" . }}
  {{- include "common-helm-library.resources.clusterIssuer" . }}
{{- end -}}

