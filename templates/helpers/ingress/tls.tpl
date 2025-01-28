{{- define "common-helm-library.helpers.ingress.tls" }}
{{- if .Values.ingress.hosts }}
tls:
  {{- range .Values.ingress.hosts }}
  {{- if .tls.enabled }}
  - hosts:
      - {{ .host }}
    secretName: {{ .tls.secretName }}
  {{- end }}
  {{- end }}
{{- end }}
{{- end }}
