{{- define "common-helm-library.resources.workload" }}
{{- if .Values.workload.enabled -}}
apiVersion: apps/v1
kind: {{ .Values.workload.type }}
metadata:
  name: {{ .Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.labels" . | indent 4 }}
    {{- if .Values.workload.labels }}
    {{- toYaml .Values.workload.labels | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.annotations" . | indent 4 }}
    {{- if .Values.workload.annotations }}
    {{- toYaml .Values.workload.annotations | nindent 4 }}
    {{- end }}
spec:
  {{- include "common-helm-library.helpers.workload.replicas" . | indent 2 }}
  {{- include "common-helm-library.helpers.workload.servicename" . | indent 2 }}
  {{- include "common-helm-library.helpers.workload.strategy" . | indent 2 }}
  selector:
    matchLabels:
      {{- include "common-helm-library.helpers.metadata.selector-labels" . | indent 6 }}
  template:
    metadata:
      labels:
        {{- include "common-helm-library.helpers.metadata.labels" . | indent 8 }}
        {{- if .Values.workload.labels }}
        {{- toYaml .Values.workload.labels | nindent 8 }}
        {{- end }}
      annotations:
        {{- include "common-helm-library.helpers.metadata.annotations" . | indent 8 }}
        {{- if .Values.workload.annotations }}
        {{- toYaml .Values.workload.annotations | nindent 8 }}
        {{- end }}
    spec:
      {{- include "common-helm-library.helpers.workload.serviceaccount" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.terminationgraceperiodseconds" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.priorityclass" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.nodeselector" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.tolerations" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.affinity" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.topologyspreadconstraints" . | indent 6 }}
      containers:
        - name: {{ .Release.Name | lower }}
          {{- include "common-helm-library.helpers.workload.command" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.args" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.envs" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.image" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.ports" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.probes" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.resources" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.securitycontext" . | indent 10 }}
          {{- include "common-helm-library.helpers.workload.volumeMounts" . | indent 10 }}
      {{- include "common-helm-library.helpers.workload.volumes" . | indent 6 }}
      {{- include "common-helm-library.helpers.workload.volumeClaimTemplates" . | indent 6 }}
---
{{- end }}
{{- end }}
