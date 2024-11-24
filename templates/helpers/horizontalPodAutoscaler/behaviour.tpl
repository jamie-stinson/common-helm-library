{{- define "common-helm-library.helpers.horizontalpodautoscaler.behaviour" }}
{{- with .Values.autoscaling.behavior }}
behavior:
{{- toYaml . | nindent 4 }}
{{- end }}
{{- end }}
