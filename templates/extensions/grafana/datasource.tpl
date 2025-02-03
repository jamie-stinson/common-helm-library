{{- define "common-helm-library.extensions.grafana.datasource" }}
{{- if .Values.grafana.datasource.enabled }}
{{- with .Values.grafana.datasource }}
apiVersion: grafana.integreatly.org/v1beta1
kind: GrafanaDatasource
metadata:
  name: {{ $.Release.Name }}
spec:
  {{- toYaml .spec | nindent 2 }}
---
{{- end }}
{{- end }}
{{- end }}
