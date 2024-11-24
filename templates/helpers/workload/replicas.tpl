{{- define "common-helm-library.helpers.workload.replicas" }}
{{- if ne .Values.workload.type "DaemonSet" }}
replicas: {{ .Values.workload.replicaCount }}
{{- end }}
{{- end }}
