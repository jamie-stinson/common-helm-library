{{- define "common-helm-library.helpers.workload.volumeMounts" }}
{{- with .storage }}
volumeMounts:
  {{- range . }}
  - name: {{ .name }}
    mountPath: {{ .mountPath }}
    {{- with .readOnly }}
    readOnly: {{ . }}
    {{- end }}
    {{- with .mountPropagation }}
    mountPropagation: {{ . }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
