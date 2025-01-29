{{- define "common-helm-library.resources.persistentVolume" }}
{{- if .Values.persistentVolume.enabled }}
{{- with .Values.persistentVolume }}
{{- range .volumes }}
apiVersion: v1
kind: PersistentVolume
metadata:
  name: {{ .name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  capacity:
    storage: {{ .capacity }}
  accessModes:
  {{- range .accessModes }}
    - {{ . }}
  {{- end }}
  {{- if .storageClass }}
  storageClassName: {{ .storageClass }}
  {{- end }}
  {{- if .hostPath }}
  hostPath:
    path: {{ .hostPath }}
  {{- end }}
  {{- if .nfs }}
  nfs:
    server: {{ .nfs.server }}
    path: {{ .nfs.path }}
    {{- if .nfs.readOnly }}
    readOnly: {{ .nfs.readOnly }}
    {{- end }}
  {{- end }}
  {{- if .claim }}
  claimRef:
    name: {{ .claim.name }}
    namespace: {{ .claim.namespace }}
  {{- end }}
  persistentVolumeReclaimPolicy: {{ .persistentVolumeReclaimPolicy }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}
