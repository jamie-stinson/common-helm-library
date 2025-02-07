{{- define "common-helm-library.resources.workload" }}
{{- if .Values.workload.enabled }}
{{- with .Values.workload -}}
apiVersion: apps/v1
kind: {{ .type }}
metadata:
  name: {{ $.Release.Name | lower }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  {{- include "common-helm-library.helpers.workload.replicas" . | indent 2 }}
  {{- include "common-helm-library.helpers.workload.serviceName" $ | indent 2 }}
  {{- include "common-helm-library.helpers.workload.strategy" . | indent 2 }}
  selector:
    matchLabels:
      {{- include "common-helm-library.helpers.metadata.commonSelectorLabels" $ | indent 6 }}
  template:
    metadata:
      labels:
        {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 8 }}
        {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 8 }}
      annotations:
        {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 8 }}
        {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 8 }}
    spec:
      {{- include "common-helm-library.helpers.workload.serviceAccountName" $ | indent 6 }}
      {{- include "common-helm-library.helpers.workload.terminationGracePeriodSeconds" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.priorityclass" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.nodeselector" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.tolerations" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.affinity" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.topologySpreadConstraints" . | indent 6 }}
      {{- with .podSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
        - name: {{ $.Release.Name | lower }}
          {{- include "common-helm-library.helpers.workload.image" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.command" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.args" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.envs" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.ports" $ | indent 10 }}
          {{- include "common-helm-library.helpers.workload.probes" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.resources" . | indent 8 }}
          {{- include "common-helm-library.helpers.workload.securityContext" $ | indent 10 }}
          {{- include "common-helm-library.helpers.workload.volumeMounts" . | indent 10 }}
        {{- if .extraContainers }}
        {{- toYaml .extraContainers | nindent 8 }}
        {{- end }}
      {{- include "common-helm-library.helpers.workload.volumes" . | indent 6 }}
---
{{- end }}
{{- end }}
{{- end }}
