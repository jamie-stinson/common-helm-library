{{- define "common-helm-library.resources.persistentVolumeClaim" -}}
{{- if .Values.persistentVolumeClaim.enabled }}
{{- with .Values.persistentVolumeClaim }}
{{- range .volumes }}
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ .name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  accessModes:
  {{- range .accessModes }}
    - {{ . }}
  {{- end }}
  {{- if .volumeMode }}
  volumeMode: {{ .volumeMode }}
  {{- end }}
  {{- if .volumeName }}
  volumeName: {{ .volumeName }}
  {{- end }}
  resources:
    requests:
      storage: {{ .capacity }}
  {{- if .storageClass }}
  storageClassName: {{ .storageClass }}
  {{- end }}
  {{- if .selector }}
selector:
  matchLabels:
    {{- toYaml .selector.matchLabels | nindent 4 }}
  {{- end }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}
