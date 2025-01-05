{{- define "common-helm-library.helpers.workload.replicas" }}
{{- if ne .type "DaemonSet" }}
replicas: {{ .replicaCount }}
{{- end }}
{{- end }}
