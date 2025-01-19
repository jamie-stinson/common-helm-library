{{- define "common-helm-library.resources.ingressRoute" -}}
{{- if .Values.ingress.enabled }}
{{- with .Values.ingress }}
apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: {{ $.Release.Name }}
spec:
  entryPoints:
{{- range .entryPoints }}
    - {{ . | quote }}
{{- end }}
  routes:
    - kind: Rule
      match: Host(`{{ .prefix }}.{{ .domain }}`)
      services:
        - kind: Service
          name: {{ $.Release.Name }}
          namespace: {{ $.Release.Namespace }}
          port: {{ .port}}
  {{- if .tls }}
  tls:
    secretName: "cloudflare-{{ .domain | replace "." "" }}-certificate"
  {{- end }}
---
{{- end }}
{{- end }}
{{- end }}
