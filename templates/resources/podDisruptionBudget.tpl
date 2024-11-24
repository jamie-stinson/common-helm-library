{{- define "common-helm-library.resources.podDisruptionBudget" }}
{{- if .Values.pdb.enabled }}
apiVersion: policy/v1
kind: PodDisruptionBudget
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
{{- if .Values.pdb.maxUnavailable }}
  maxUnavailable: {{ .Values.pdb.maxUnavailable }}
{{- else if .Values.pdb.minAvailable }}
  minAvailable: {{ .Values.pdb.minAvailable }}
{{- end }}
  selector:
    matchLabels:
      {{- include "common-helm-library.helpers.metadata.selector-labels" . | indent 6 }}
{{- end }}
{{- end }}
