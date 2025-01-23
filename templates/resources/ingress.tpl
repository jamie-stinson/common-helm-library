{{- define "common-helm-library.resources.ingress" -}}
{{- if .Values.ingress.enabled }}
{{- with .Values.ingress }}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ $.Release.Name }}
  annotations:
    traefik.ingress.kubernetes.io/router.entrypoints: {{ .entryPoints | join ", " | quote }}
spec:
  rules:
  - host: {{ .prefix }}.{{ .domain }}
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ $.Release.Name }}
            port:
              name: {{ .port}}
{{- if .tls }}
  tls:
  - hosts:
    - {{ .prefix }}.{{ .domain }}
    secretName: "cloudflare-{{ .domain | replace "." "" }}-certificate"
{{- end }}
---
{{- end }}
{{- end }}
{{- end }}

