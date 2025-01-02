{{- define "common-helm-library.resources.certificate" }}
{{- if and (eq .Release.Name "cert-manager-controller") .Values.certificate.enabled }}
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: letsencrypt-wildcard
  namespace: traefik
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
  secretName: wildcard-tls
  dnsNames:
    - '{{ .Values.certificate.domain }}'
    - '*.{{ .Values.certificate.domain }}'
  issuerRef:
    name: cloudflare-issuer
    kind: ClusterIssuer
  secretTemplate:
    annotations:
      reflector.v1.k8s.emberstack.com/reflection-allowed: "true"  
      reflector.v1.k8s.emberstack.com/reflection-allowed-namespaces: ""
      reflector.v1.k8s.emberstack.com/reflection-auto-enabled: "true"
      reflector.v1.k8s.emberstack.com/reflection-allowed-namespaces: ""
---
{{- end }}
{{- end }}
