{{- define "common-helm-library.helpers.workload.resources" }}
{{- if or .resources.preset .resources.custom }}
{{- with .resources }}
resources:
  {{- if and .preset (or .custom.requests .custom.limits) }}
  {{- fail "Cannot use both 'preset' and 'custom' configurations simultaneously." }}
  {{- end }}

  {{- if .preset }}
  {{- if eq .preset "nano" }}
  requests:
    cpu: "50m"
    memory: "64Mi"
  {{- else if eq .preset "micro" }}
  requests:
    cpu: "100m"
    memory: "128Mi"
  {{- else if eq .preset "small" }}
  requests:
    cpu: "250m"
    memory: "256Mi"
  {{- else if eq .preset "medium" }}
  requests:
    cpu: "500m"
    memory: "512Mi"
  {{- else if eq .preset "large" }}
  requests:
    cpu: "756m"
    memory: "1Gi"
  limits:
    cpu: "756m"
    memory: "1Gi"
  {{- else if eq .preset "xlarge" }}
  requests:
    cpu: "1"
    memory: "2Gi"
  {{- else if eq .preset "2xlarge" }}
  requests:
    cpu: "2"
    memory: "4Gi"
  {{- else if eq .preset "4xlarge" }}
  requests:
    cpu: "4"
    memory: "8Gi"
  {{- end }}
  {{- end }}

  {{- if .custom.requests }}
  requests:
    {{- toYaml .custom.requests | nindent 4 }}
  {{- end }}
  {{- if .custom.limits }}
  limits:
    {{- toYaml .custom.limits | nindent 4 }}
  {{- end }}
{{- end }}
{{- end }}
{{- end }}
