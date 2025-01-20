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
  {{- end }}
{{- end }}
{{- end }}
{{- end }}
