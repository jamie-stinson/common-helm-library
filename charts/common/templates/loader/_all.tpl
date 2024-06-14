{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "common-helm-library.loader.all" -}}
  {{- /* Build templates */ -}}
  {{- include "common-helm-library.resources.workload" . }}
  {{- include "common-helm-library.resources.ingressroute" . }}
  {{- include "common-helm-library.resources.service" . }}
  {{- include "common-helm-library.resources.serviceAccount" . }}
  {{- include "common-helm-library.resources.configmap" . }}
  {{- include "common-helm-library.resources.persistentVolume" . }}
  {{- include "common-helm-library.resources.persistentVolumeClaim" . }}
  {{- include "common-helm-library.resources.role" . }}
  {{- include "common-helm-library.resources.rolebinding" . }}
  {{- include "common-helm-library.resources.storageClass" . }}
  {{- include "common-helm-library.resources.certificate" . }}
  {{- include "common-helm-library.resources.clusterIssuer" . }}
{{- end -}}

