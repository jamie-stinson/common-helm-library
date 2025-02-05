{{- define "common-helm-library.helpers.ingress.tls" }}
{{- if .hosts }}
tls:
  {{- range .hosts }}
  {{- if .tls.enabled }}
  - hosts:
      - {{ .host }}
    secretName: {{ .tls.secretName }}
  {{- end }}
  {{- end }}
{{- end }}
{{- end }}
