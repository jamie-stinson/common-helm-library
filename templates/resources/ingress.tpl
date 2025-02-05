{{- define "common-helm-library.resources.ingress" -}}
{{- if .Values.ingress.enabled }}
{{- with .Values.ingress }}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  ingressClassName: {{ .ingressClass }}
  {{- include "common-helm-library.helpers.ingress.rules" . | indent 2 }}
  {{- include "common-helm-library.helpers.ingress.tls" . | indent 2 }}
---
{{- end }}
{{- end }}
{{- end }}
