{{- define "common-helm-library.helpers.workload.ports" }}
{{- if .Values.service.enabled }}
{{- with .Values.service }}
ports:
  {{- range .ports }}
  - name: {{ .name }}
    containerPort: {{ .port }}
  {{- end }}
{{- end }}
{{- end }}
