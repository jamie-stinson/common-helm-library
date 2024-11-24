{{- define "common-helm-library.helpers.service.ports" }}
{{- if .Values.service.ports }}
ports:
  {{- range .Values.service.ports }}
  - name: {{ .name }}
    protocol: {{ .protocol }}
    port: {{ .port }}
    targetPort: {{ .port }}
    {{- if and (eq .type "NodePort") .nodePort }}
    nodePort: {{ .nodePort }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
