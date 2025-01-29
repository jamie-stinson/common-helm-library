{{- define "common-helm-library.resources.multiplePersistentVolumes" -}}
{{- if .Values.persistentVolumes.enabled }}
apiVersion: v1
kind: List
items:
{{- range .Values.persistentVolumes.volumes }}
- {{- with . }}
  apiVersion: v1
  kind: PersistentVolume
  metadata:
    name: {{ .name }}
    labels:
      {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
      {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  spec:
    capacity:
      storage: {{ .capacity }}
    accessModes:
    {{- range .accessModes }}
      - {{ . }}
    {{- end }}
    {{- if .storageClassName }}
    storageClassName: {{ .storageClassName }}
    {{- end }}
    {{- if .hostPath }}
    hostPath:
      path: {{ .hostPath.path }}
    {{- end }}
    {{- if .nfs }}
    nfs:
      server: {{ .nfs.server }}
      path: {{ .nfs.path }}
      readOnly: {{ .nfs.readOnly }}
    {{- end }}
    {{- if .claimRef }}
    claimRef:
      name: {{ .claimRef.name }}
      namespace: {{ .claimRef.namespace }}
    {{- end }}
    persistentVolumeReclaimPolicy: {{ .persistentVolumeReclaimPolicy }}
    {{- if .annotations }}
    annotations:
      {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
      {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
    {{- end }}
  {{- end }}
---
{{- end }}
{{- end }}
{{- end }}