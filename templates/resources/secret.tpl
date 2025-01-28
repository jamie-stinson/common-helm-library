{{- define "common-helm-library.resources.secret" }}
{{- if .Values.secret.enabled }}
{{- with .Values.secret }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ $.Release.Name }}
  {{- if .namespace }}
  namespace: {{ .namespace }}
  {{- end }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
type: Opaque
stringData:
  {{- toYaml .secrets | nindent 2 }}
---
{{- end }}
{{- end }}
{{- end }}
