{{- define "common-helm-library.helpers.workload.serviceAccountName" }}
{{- if $.Values.serviceAccount.enabled }}
serviceAccountName: {{ $.Release.Name | lower }}
{{- end }}
{{- end }}
