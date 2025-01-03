{{- define "common-helm-library.helpers.workload.ports" }}
{{- if .Values.services }}
ports:
  {{- range .Values.services}}
  {{- range .ports }}
  - name: {{ .name }}
    containerPort: {{ .port }}
  {{- end }}
  {{- end }}
{{- end }}
{{- end }}
