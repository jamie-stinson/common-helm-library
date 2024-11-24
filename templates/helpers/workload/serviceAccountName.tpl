{{- define "common-helm-library.helpers.workload.serviceaccount" }}
{{- if .Values.serviceAccount.enabled }}
serviceAccountName: {{ .Release.Name | lower }}
{{- end }}
{{- end }}
