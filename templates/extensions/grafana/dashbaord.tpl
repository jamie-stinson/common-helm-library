{{- define "common-helm-library.extensions.grafana.dashboard" }}
{{- if .Values.grafana.dashboard.enabled }}
{{- with .Values.grafana.dashboard }}
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaDashboard
metadata:
  name: {{ $.Release.Name }}
spec:
  instanceSelector:
    matchLabels:
      dashboards: "grafana"
  json: >
    {{ toJson .json }}
---
{{- end }}
{{- end }}
{{- end }}
