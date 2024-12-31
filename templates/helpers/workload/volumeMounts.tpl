{{- define "common-helm-library.helpers.workload.volumeMounts" }}
{{- if .Values.workload.storage }}
volumeMounts:
  {{- range .Values.workload.storage }}
  - name: {{ .name }}
    mountPath: {{ .mountPath }}
    {{- if .readOnly }}
    readOnly: {{ .readOnly }}
    {{- end }}
    {{- if .mountPropagation }}
    mountPropagation: {{ .mountPropagation }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
