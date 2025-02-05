{{- define "common-helm-library.extensions.grafana.dashboard" }}
{{- if .Values.grafana.dashboard.enabled }}
{{- with .Values.grafana.dashboard }}
{{- range .dashboards }}
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaDashboard
metadata:
  name: {{ .name }}
spec:
  allowCrossNamespaceImport: true
  {{- if $.Values.grafana.dashboard.cacheDuration }}
  contentCacheDuration: {{ $.Values.grafana.dashboard.cacheDuration }}
  {{- end }}
  {{- if $.Values.grafana.dashboard.resyncPeriod }}
  resyncPeriod: {{ $.Values.grafana.dashboard.resyncPeriod }}
  {{- end }}
  {{- if .folder }}
  folder: {{ .folder }}
  {{- end }}
  instanceSelector:
    matchLabels:
      dashboards: "grafana"
  {{- if .json }}
  json: >
    {{ toJson .json }}
  {{- end }}
  {{- if .url }}
  url: {{ .url }}
  {{- end }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}
