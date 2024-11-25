{{- define "common-helm-library.helpers.workload.strategy" }}
{{- if eq .Values.workload.type "Deployment" }}
strategy:
  type: {{ .Values.workload.strategy.type }}
  {{- if eq .Values.workload.strategy.type "RollingUpdate" }}
  rollingUpdate:
    maxSurge: {{ .Values.workload.strategy.maxSurge }}
    maxUnavailable: {{ .Values.workload.strategy.maxUnavailable }}
  {{- end }}
{{- end }}
{{- if eq .Values.workload.type "StatefulSet" }}
updateStrategy:
  type: {{ .Values.workload.strategy.type }}
{{- end }}
{{- end }}
