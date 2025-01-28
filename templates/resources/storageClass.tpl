{{- define "common-helm-library.resources.storageClass" -}}
{{- if .Values.storageClass.enabled }}
{{- with .Values.storageClass }}
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
provisioner: {{ .provisioner }}
reclaimPolicy: {{ .reclaimPolicy }}
{{- if .allowVolumeExpansion }}
allowVolumeExpansion: {{ .allowVolumeExpansion }}
{{- end }}
{{- with .parameters }}
parameters:
{{- toYaml . | nindent 2 }}
{{- end }}
{{- with .mountOptions }}
mountOptions:
{{- toYaml . | nindent 2 }}
{{- end }}
---
{{- end }}
{{- end }}
{{- end }}
