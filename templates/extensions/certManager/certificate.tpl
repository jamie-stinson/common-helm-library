{{- define "common-helm-library.extensions.certManager.certificate" }}
{{- if .Values.certificate.enabled }}
{{- with .Values.certificate }}
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  {{- toYaml .spec | nindent 2 }}
---
{{- end }}
{{- end }}
{{- end }}
