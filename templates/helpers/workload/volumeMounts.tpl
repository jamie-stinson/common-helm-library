{{- define "common-helm-library.helpers.workload.volumeMounts" }}
  {{- $workloadType := .type}}
{{- with .storage }}
  {{- $validVolumeMounts := list }}
  
  {{- range . }}
    {{- if or (ne .type "pvcTemplate") (eq $workloadType "StatefulSet") }}
      {{- $validVolumeMounts = append $validVolumeMounts . }}
    {{- end }}
  {{- end }}

  {{- if $validVolumeMounts }}
volumeMounts:
  {{- range $validVolumeMounts }}
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
{{- end }}
