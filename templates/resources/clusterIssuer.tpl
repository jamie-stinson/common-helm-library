{{- define "common-helm-library.resources.clusterIssuer" }}
{{- if .Values.wildcardCertificate.enabled }}
{{- with .Values.wildcardCertificate }}
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: "{{ .issuer }}-{{ .domain | replace "." "" }}-issuer"
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  acme:
    email: {{ .email }}
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: {{ .issuer }}-acme-key
    solvers:
      {{- if eq .issuer "cloudflare" }}
      - dns01:
          cloudflare:
            email: {{ .email }}
            apiTokenSecretRef:
              name: cloudflare-api-token
              key: api-token
      {{- end }}
---
{{- if eq .issuer "cloudflare" }}
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-token
type: Opaque
stringData:
  api-token: {{ .apiToken }}
{{- end }}
---
{{- end }}
{{- end }}
{{- end }}