{{- define "common-helm-library.helpers.horizontalPodAutoscaler.metrics" }}
metrics:
{{- with .metrics }}
  {{- toYaml . | nindent 4 }}
{{- else }}
  {{- with .targetMemoryUtilizationPercentage }}
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: {{ . }}
  {{- end }}
  {{- with .targetCPUUtilizationPercentage }}
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: {{ . }}
  {{- end }}
{{- end }}
{{- end }}
