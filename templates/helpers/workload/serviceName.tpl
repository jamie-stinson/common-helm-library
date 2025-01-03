{{- define "common-helm-library.helpers.workload.servicename" }}
{{- if and (eq .Values.workload.type "StatefulSet") .Values.services}}
serviceName: {{ .Release.Name }}-internal
{{- end }}
{{- end }}
