{{- define "common-helm-library.helpers.workload.volumeClaimTemplates" }}
{{- if eq .type "StatefulSet" }}
{{- with .storage }}
{{- range .}}
{{- if eq .type "pvcTemplate" }}
volumeClaimTemplates:
  - apiVersion: v1	
    kind: PersistentVolumeClaim	
    metadata:
      name: {{ .name }}
    spec:
      accessModes:
        {{- toYaml .accessModes | nindent 6 }}
      storageClassName: {{ .storageClass }}
      resources:
        requests:
          storage: {{ .size }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
