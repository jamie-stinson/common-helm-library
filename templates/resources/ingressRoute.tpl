{{- define "common-helm-library.resources.ingressroute" -}}
{{- if .Values.ingress.enabled }}
apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: {{ .Release.Name }}
spec:
  entryPoints:
    - web
    - websecure
  routes:
  - kind: Rule
    match: Host(`{{ .Values.ingress.host }}`)
    services:
    - kind: Service
      name: {{ .Release.Name }}
      namespace: {{ .Release.Namespace }}
      port: {{ .Values.ingress.containerPort }}
  tls:
    secretName: wildcard-tls
---
{{- end }}
{{- end }}
