{{- define "common-helm-library.resources.podDisruptionBudget" }}
{{- if .Values.pdb.enabled }}
{{- with .Values.pdb }}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
{{- if .maxUnavailable }}
  maxUnavailable: {{ .maxUnavailable }}
{{- else if .minAvailable }}
  minAvailable: {{ .minAvailable }}
{{- end }}
  selector:
    matchLabels:
      {{- include "common-helm-library.helpers.metadata.commonSelectorLabels" $ | indent 6 }}
---
{{- end }}
{{- end }}
{{- end }}
