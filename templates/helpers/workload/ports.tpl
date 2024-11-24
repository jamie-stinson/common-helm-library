{{- define "common-helm-library.helpers.workload.ports" }}
{{- if and .Values.service.enabled .Values.service.ports }}
ports:
  {{- range .Values.service.ports }}
  - name: {{ .name }}
    containerPort: {{ .port }}
  {{- end }}
{{- end }}
{{- end }}
