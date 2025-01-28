{{- define "common-helm-library.extensions.certManager.issuer" }}
{{- if .Values.issuer.enabled }}
{{- with .Values.issuer }}
{{- $validTypes := dict "Issuer" true "ClusterIssuer" true }}
{{- if not (hasKey $validTypes .type ) }}
  {{- fail "Invalid issuer type, must be one of (Issuer, ClusterIssuer)" }}
{{- end }}
apiVersion: cert-manager.io/v1
kind: {{ .type | title }}
metadata:
  name: "{{ $.Release.Name }}"
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
