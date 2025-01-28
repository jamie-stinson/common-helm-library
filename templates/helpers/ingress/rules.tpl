{{- define "common-helm-library.helpers.ingress.rules" }}
{{- if .Values.ingress.hosts }}
rules:
  {{- range .Values.ingress.hosts }}
  - host: {{ .host  }}
    http:
      paths:
        - path: {{ .path }}
          pathType: {{ .pathType }}
          backend:
            service:
              name: {{ .backend.service.name }}
              port:
                number: {{ .backend.service.port }}
  {{- end }}
{{- end }}
{{- end }}
