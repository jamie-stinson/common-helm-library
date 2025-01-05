{{- define "common-helm-library.helpers.workload.strategy" }}
{{- if eq .type "Deployment" }}
  {{- if eq .strategy.type "RollingUpdate" }}
strategy:
  type: {{ .strategy.type }}
  rollingUpdate:
    maxSurge: {{ .strategy.maxSurge }}
    maxUnavailable: {{ .strategy.maxUnavailable }}
  {{- end }}
{{- end }}
{{- if eq .type "StatefulSet" }}
updateStrategy:
  type: {{ .strategy.type }}
{{- end }}
{{- end }}
