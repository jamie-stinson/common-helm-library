{{- define "common-helm-library.resources.serviceAccount" -}}
{{- if .Values.serviceAccount.enabled }}
{{- with .Values.serviceAccount }}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
automountServiceAccountToken: {{ .automountServiceAccountToken | default true }}
---
{{- end }}
{{- end }}
{{- end }}
