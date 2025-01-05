{{- define "common-helm-library.helpers.workload.serviceName" }}
{{- if and (eq .type "StatefulSet") $.Values.services}}
serviceName: {{ $.Release.Name }}-internal
{{- end }}
{{- end }}
