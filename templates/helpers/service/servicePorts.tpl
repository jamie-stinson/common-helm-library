{{- define "common-helm-library.helpers.service.servicePorts" }}
ports:
  {{- if .Values.serviceMonitor.enabled }}
  {{- with .Values.serviceMonitor }}
  - name: metrics
    protocol: TCP
    port: {{ .port }}
  {{- end }}
  {{- end }}
  {{- with .Values.service.ports }}
  {{- range . }}
  - name: {{ .name }}
    protocol: {{ .protocol }}
    port: {{ .port }}
    targetPort: {{ .port }}
  {{- end }}
{{- end }}
{{- end }}
