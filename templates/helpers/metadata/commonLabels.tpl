{{- define "common-helm-library.helpers.metadata.commonLabels" }}
app.kubernetes.io/name: {{ .Release.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.workload.image.tag }}
app.kubernetes.io/version: {{ . }}
helm.sh/chart: {{ $.Release.Name }}-{{ . | replace "+" "_" }}
{{- else }}
helm.sh/chart: {{ $.Release.Name }}
{{- end }}
{{- with .Values.global.labels }}
{{- toYaml .| nindent 0 }}
{{- end }}
{{- end }}
