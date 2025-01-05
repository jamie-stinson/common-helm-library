{{- define "common-helm-library.resources.serviceMonitor" -}}
{{- if .Capabilities.APIVersions.Has "monitoring.coreos.com/v1" }}
{{- if .Values.serviceMonitor.enabled }}
{{- with .Values.serviceMonitor }}
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  endpoints:
    - port: metrics
      {{- with .interval }}
      interval: {{ . }}
      {{- end }}
      {{- with .scrapeTimeout }}
      scrapeTimeout: {{ . }}
      {{- end }}
      {{- with .path }}
      path: {{ . }}
      {{- end }}
      {{- with .relabelings }}
      relabelings:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .metricRelabelings }}
      metricRelabelings:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .honorLabels }}
      honorLabels: {{ . }}
      {{- end }}
      {{- with .scheme }}
      scheme: {{ . }}
      {{- end }}
      {{- with .tlsConfig }}
      tlsConfig:
        {{- toYaml . | nindent 8 }}
      {{- end }}
  selector:
    matchLabels:
      {{- include "common-helm-library.helpers.metadata.commonSelectorLabels" $ | indent 6 }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}