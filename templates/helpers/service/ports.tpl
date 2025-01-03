{{- define "common-helm-library.helpers.service.ports" }}
{{- if .ports}}
ports:
  {{- range .ports }}
  - name: {{ .name }}
    protocol: {{ .protocol }}
    port: {{ .port }}
    targetPort: {{ .port }}
    {{- if .nodePort }}
    nodePort: {{ .nodePort }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
