{{- define "common-helm-library.resources.service" }}
{{- if .Values.service.enabled }}
{{- with .Values.service }}
apiVersion: v1
kind: Service
metadata:
  name: {{ .name | default $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  type: ClusterIP
  selector:
    {{- if not .selector }}
    {{- include "common-helm-library.helpers.metadata.commonSelectorLabels" $ | indent 4 }}
    {{- else }}
    {{- toYaml .selector | nindent 4}}
    {{- end }}  
  {{- include "common-helm-library.helpers.service.loadBalancerIP" . | indent 2 }}
  {{- include "common-helm-library.helpers.service.clusterIP" . | indent 2 }}
  {{- if .publishNotReadyAddresses }}
  publishNotReadyAddresses: true
  {{- end }}
  {{- include "common-helm-library.helpers.service.servicePorts" $ | indent 2 }}
---
{{- end }}
{{- end }}
{{- if .Values.expose.enabled }}
{{- with .Values.expose }}
{{- if not (or (eq .type "NodePort") (eq .type "LoadBalancer")) }}
{{- fail (printf "Invalid expose.service type: '%s'. Only 'NodePort' or 'LoadBalancer' are allowed." .type) }}
{{- end }}
apiVersion: v1
kind: Service
metadata:
  name: {{ $.Release.Name }}-expose
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  type: {{ .type }}
  selector:
    {{- if not .selector }}
    {{- include "common-helm-library.helpers.metadata.commonSelectorLabels" $ | indent 4 }}
    {{- else }}
    {{- toYaml .selector | nindent 4}}
    {{- end }}  
  {{- include "common-helm-library.helpers.service.loadBalancerIP" . | indent 2 }}
  {{- include "common-helm-library.helpers.service.exposePorts" $ | indent 2 }}
---
{{- end }}
{{- end }}
{{- end }}
