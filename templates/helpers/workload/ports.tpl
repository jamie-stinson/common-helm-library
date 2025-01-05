{{- define "common-helm-library.helpers.workload.ports" }}
{{- with .Values.services }}
ports:
  {{- range . }}
  {{- range .ports }}
  - name: {{ .name }}
    containerPort: {{ .port }}
  {{- end }}
  {{- end }}
{{- end }}
{{- end }}
