{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "common-helm-library.loader.all" }}
  {{- /* Build templates */ -}}
  {{- include "common-helm-library.resources.workload" . }}
  {{- include "common-helm-library.resources.service" . }}
  {{- include "common-helm-library.resources.horizontalPodAutoscaler" . }}
  {{- include "common-helm-library.resources.podDisruptionBudget" . }}
  {{- include "common-helm-library.resources.configMap" . }}
  {{- include "common-helm-library.resources.serviceAccount" . }}
  {{- include "common-helm-library.resources.role" . }}
  {{- include "common-helm-library.resources.roleBinding" . }}
  {{- include "common-helm-library.resources.ingressClass" . }}
  {{- include "common-helm-library.resources.ingress" . }}
  {{- include "common-helm-library.resources.storageClass" . }}
  {{- include "common-helm-library.resources.secret" . }}
  {{- include "common-helm-library.resources.persistentVolume" . }}
  {{- include "common-helm-library.resources.persistentVolumeClaim" . }}
  {{- include "common-helm-library.resources.extraObjects" . }}
  {{- include "common-helm-library.extensions.postgres.cluster" . }}
  {{- include "common-helm-library.extensions.prometheus.serviceMonitor" . }}
  {{- include "common-helm-library.extensions.certManager.certificate" . }}
  {{- include "common-helm-library.extensions.certManager.issuer" . }}
{{- end }}
