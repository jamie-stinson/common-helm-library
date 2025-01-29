{{- define "common-helm-library.resources.multiplePersistentVolumesClaim" -}}
{{- if .Values.persistentVolumeClaims.enabled }}
apiVersion: v1
kind: List
items:
{{- range .Values.persistentVolumeClaims.volumes }}
- {{- with . }}
  apiVersion: v1
  kind: PersistentVolumeClaim
  metadata:
    name: {{ .name }}
    namespace: {{ $.Release.Namespace }}
    labels:
      {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
      {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  spec:
    accessModes:
    {{- range .accessModes }}
      - {{ . }}
    {{- end }}
    {{- if .volumeMode }}
    volumeMode: {{ .volumeMode }}
    {{- end }}
    volumeName: {{ .volumeName }}
    resources:
      requests:
        storage: {{ .resources.requests.storage }}
    {{- if .storageClassName }}
    storageClassName: {{ .storageClassName }}
    {{- end }}
    {{- if .selector }}
  selector:
    matchLabels:
      {{- toYaml .selector.matchLabels | nindent 6 }}
    {{- end }}
  {{- end }}
---
{{- end }}
{{- end }}
{{- end }}