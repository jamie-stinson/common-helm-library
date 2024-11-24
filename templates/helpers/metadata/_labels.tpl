{{/*
Common & Global Labels
*/}}
{{- define "common-helm-library.helpers.metadata.labels" }}
app.kubernetes.io/name: {{ .Release.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Values.workload.image.tag }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Release.Name }}-{{ .Values.workload.image.tag | replace "+" "_" }}
{{- if .Values.global.labels }}
{{- toYaml .Values.global.labels | nindent 0 }}
{{- end }}
{{- end }}
