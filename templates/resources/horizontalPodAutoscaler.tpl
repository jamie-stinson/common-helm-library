{{- define "common-helm-library.resources.horizontalPodAutoscaler" }}
{{- if .Values.autoscaling.enabled -}}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ .Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.labels" . | indent 4 }}
    {{- if .Values.serviceAccount.labels }}
    {{- toYaml .Values.serviceAccount.labels | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.annotations" . | indent 4 }}
    {{- if .Values.serviceAccount.annotations }}
    {{- toYaml .Values.serviceAccount.annotations | nindent 4 }}
    {{- end }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: {{ .Values.workload.type }}
    name: {{ .Release.Name }}
  minReplicas: {{ .Values.autoscaling.minReplicas }}
  maxReplicas: {{ .Values.autoscaling.maxReplicas }}
  {{- include "common-helm-library.helpers.horizontalpodautoscaler.metrics" . | indent 2 }}
  {{- include "common-helm-library.helpers.horizontalpodautoscaler.behaviour" . | indent 2 }}
---
{{- end }}
{{- end }}
