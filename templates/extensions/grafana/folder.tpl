{{- define "common-helm-library.extensions.grafana.folder" }}
{{- if .Values.grafana.folder.enabled }}
{{- with .Values.grafana.folder }}
{{- range .folders }}
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaFolder
metadata:
  name: {{ .name }}
spec:
  allowCrossNamespaceImport: true
  {{- if $.Values.grafana.folder.resyncPeriod }}
  resyncPeriod: {{ $.Values.grafana.folder.resyncPeriod }}
  {{- end }}
  {{- if .parentFolder }}
  parentFolderRef: {{ .parentFolder }}
  {{- end }}
  instanceSelector:
    matchLabels:
      dashboards: "grafana"
  title: {{ .title }}
  {{- if .permissions }}
  permissions: |
    {{- .permissions | nindent 4}}
  {{- end }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}
