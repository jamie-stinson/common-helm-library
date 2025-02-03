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
  instanceSelector:
    matchLabels:
      dashboards: "grafana"
  json: >
    {{ toJson .json }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}
