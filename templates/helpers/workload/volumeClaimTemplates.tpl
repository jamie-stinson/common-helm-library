{{- define "common-helm-library.helpers.workload.volumeClaimTemplates" }}
{{- if and (.Values.workload.storage) (eq .Values.workload.type "StatefulSet") }}
{{- range .Values.workload.storage }}
{{- if eq .type "template" }}
persistentVolumeClaimRetentionPolicy:
  whenDeleted: {{ .whenDeleted }}
  whenScaled: {{ .whenScaled }}
volumeClaimTemplates:
  - metadata:
      name: {{ .name }}
      spec:
      storageClassName: {{ .storageClass }}
      accessModes: {{ .accessModes | toYaml | nindent 10 }}
      resources:
          requests:
            storage: {{ .sizeLimit }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
