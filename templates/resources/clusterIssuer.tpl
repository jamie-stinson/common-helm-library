{{- define "common-helm-library.resources.clusterissuer" }}
{{- if and (eq .Release.Name "cert-manager-controller") .Values.certificate.enabled }}
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: {{ .Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.labels" . | indent 4 }}
    {{- if .Values.certificate.labels }}
    {{- toYaml .Values.certificate.labels | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.annotations" . | indent 4 }}
    {{- if .Values.certificate.annotations }}
    {{- toYaml .Values.certificate.annotations | nindent 4 }}
    {{- end }}
spec:
  acme:
    email: {{ .Values.certificate.email }}
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: cloudflare-key
    solvers:
    - dns01:
        cloudflare:
          email: {{ .Values.certificate.email }}
          apiTokenSecretRef:
            name: cloudflare-api-token
            key: api-token
---
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-token
type: Opaque
stringData:
  api-token: {{ .Values.certificate.cloudflareApiToken}}
---
{{- end }}
{{- end }}
