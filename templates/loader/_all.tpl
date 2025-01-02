{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "common-helm-library.loader.all" }}
  {{- /* Build templates */ -}}
  {{- include "common-helm-library.resources.workload" . }}
  {{- include "common-helm-library.resources.service" . }}
  {{- include "common-helm-library.resources.horizontalPodAutoscaler" . }}
  {{- include "common-helm-library.resources.podDisruptionBudget" . }}
  {{- include "common-helm-library.resources.configMaps" . }}
  {{- include "common-helm-library.resources.serviceAccount" . }}
  {{- include "common-helm-library.resources.role" . }}
  {{- include "common-helm-library.resources.roleBinding" . }}
  {{- include "common-helm-library.resources.serviceMonitor" . }}
  {{- include "common-helm-library.resources.certificate" . }}
  {{- include "common-helm-library.resources.clusterissuer" . }}
{{- end }}
