{{- define "common-helm-library.resources.serviceMonitor" -}}
{{- if and (.Capabilities.APIVersions.Has "monitoring.coreos.com/v1") .Values.serviceMonitor.enabled .Values.service.enabled }}
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ .Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.labels" . | indent 4 }}
    {{- if .Values.serviceMonitor.labels }}
    {{- toYaml .Values.serviceMonitor.labels | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.annotations" . | indent 4 }}
    {{- if .Values.serviceMonitor.annotations }}
    {{- toYaml .Values.serviceMonitor.annotations | nindent 4 }}
    {{- end }}
spec:
  endpoints:
    - port: metrics
      {{- with .Values.serviceMonitor.interval }}
      interval: {{ . }}
      {{- end }}
      {{- with .Values.serviceMonitor.scrapeTimeout }}
      scrapeTimeout: {{ . }}
      {{- end }}
      {{- with .Values.serviceMonitor.path }}
      path: {{ . }}
      {{- end }}
      {{- with .Values.serviceMonitor.relabelings }}
      relabelings:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.serviceMonitor.metricRelabelings }}
      metricRelabelings:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      honorLabels: {{ .Values.serviceMonitor.honorLabels }}
      {{- with .Values.serviceMonitor.scheme }}
      scheme: {{ . }}
      {{- end }}
      {{- with .Values.serviceMonitor.tlsConfig }}
      tlsConfig:
        {{- toYaml . | nindent 8 }}
      {{- end }}
  selector:
    matchLabels:
      {{- include "common-helm-library.helpers.metadata.selector-labels" . | indent 6 }}
---
{{- end }}
{{- end }}
