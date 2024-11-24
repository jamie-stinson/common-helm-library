{{- define "common-helm-library.helpers.horizontalpodautoscaler.metrics" }}
metrics:
{{- with .Values.autoscaling.metrics }}
  {{- toYaml . | nindent 4 }}
{{- else }}
  {{- with .Values.autoscaling.targetMemoryUtilizationPercentage }}
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: {{ . }}
  {{- end }}
  {{- with .Values.autoscaling.targetCPUUtilizationPercentage }}
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: {{ . }}
  {{- end }}
{{- end }}
{{- end }}
