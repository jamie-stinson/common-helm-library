{{- define "common-helm-library.helpers.volumes.volumeClaimTemplates" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
{{- if and (.Values.storage) (eq .Values.type "StatefulSet") }}
{{- range .Values.storage }}
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