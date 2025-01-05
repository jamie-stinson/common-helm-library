{{- define "common-helm-library.resources.horizontalPodAutoscaler" }}
{{- if .Values.autoscaling.enabled }}
{{- with .Values.autoscaling }}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: {{ $.Values.workload.type }}
    name: {{ $.Release.Name }}
  minReplicas: {{ .minReplicas }}
  maxReplicas: {{ .maxReplicas }}
  {{- include "common-helm-library.helpers.horizontalPodAutoscaler.metrics" . | indent 2 }}
  {{- include "common-helm-library.helpers.horizontalPodAutoscaler.behaviour" . | indent 2 }}
---
{{- end }}
{{- end }}
{{- end }}
