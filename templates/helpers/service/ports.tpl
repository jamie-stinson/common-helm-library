{{- define "common-helm-library.helpers.service.ports" }}
{{- with .ports }}
ports:
  {{- range . }}
  - name: {{ .name }}
    protocol: {{ .protocol }}
    port: {{ .port }}
    targetPort: {{ .port }}
    {{- if .nodePort }}
    {{- $nodePort := .nodePort | int }}
    {{- if or (lt $nodePort 30000) (gt $nodePort 32767) }}
      {{- fail "Invalid nodePort: Must be between 30000 and 32767" }}
    {{- else }}
    nodePort: {{ $nodePort }}
    {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
