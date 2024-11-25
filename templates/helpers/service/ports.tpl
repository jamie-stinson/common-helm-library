{{- define "common-helm-library.helpers.service.ports" }}
{{- if or .Values.service.ports .Values.serviceMonitor.enabled }}
ports:
  {{- if .Values.serviceMonitor.enabled }}
  - name: metrics
    protocol: TCP
    port: {{ .Values.serviceMonitor.port }}
    targetPort: {{ .Values.serviceMonitor.port }}
  {{- end }}
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
