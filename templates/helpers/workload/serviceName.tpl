{{- define "common-helm-library.helpers.workload.serviceName" }}
{{- if and (eq .Values.workload.type "StatefulSet") .Values.service.enabled }}
serviceName: {{ .Release.Name }}
{{- end }}
{{- end }}
