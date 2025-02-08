{{- define "common-helm-library.helpers.workload.ports" }}
{{- if .Values.service.enabled }}
ports:
  {{- if .Values.serviceMonitor.enabled }}
  {{- with .Values.serviceMonitor }}
  - name: metrics
    containerPort: {{ .port }}
  {{- end }}
  {{- end }}
{{- with .Values.service }}
  {{- range .ports }}
  - name: {{ .name }}
    containerPort: {{ .port }}
    {{- if .protocol }}
    protocol: {{ .protocol }}
    {{- end }}
    {{- if .hostIP }}
    hostIP: {{ .hostIP }}
    {{- end }}
    {{- if .hostPort }}
    hostPort: {{ .hostPort }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
{{- end }}
