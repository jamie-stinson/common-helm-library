{{- define "common-helm-library.helpers.workload.ports" }}
{{- range .Values.services}}
{{- if .enabled }}
ports:
  {{- range .ports }}
  - name: {{ .name }}
    containerPort: {{ .port }}
  {{- end }}
{{- end }}
{{- end }}
