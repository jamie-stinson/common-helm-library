{{- define "common-helm-library.helpers.workload.resources" }}
{{- with .resources }}
  {{- $presets := dict 
      "nano" (dict "requests" (dict "cpu" "50m" "memory" "64Mi"))
      "micro" (dict "requests" (dict "cpu" "100m" "memory" "128Mi"))
      "small" (dict "requests" (dict "cpu" "250m" "memory" "256Mi"))
      "medium" (dict "requests" (dict "cpu" "500m" "memory" "512Mi"))
      "large" (dict "requests" (dict "cpu" "756m" "memory" "1Gi") "limits" (dict "cpu" "756m" "memory" "1Gi"))
      "xlarge" (dict "requests" (dict "cpu" "1" "memory" "2Gi"))
      "2xlarge" (dict "requests" (dict "cpu" "2" "memory" "4Gi"))
      "4xlarge" (dict "requests" (dict "cpu" "4" "memory" "8Gi"))
  }}
  {{- if and .preset .custom }}
    {{- fail "Cannot use both 'preset' and 'custom' configurations simultaneously." }}
  {{- end }}
  
  {{- if or .preset .custom }}
  resources:
    {{- if .preset }}
      {{- $presetConfig := index $presets .preset }}
      {{- if not $presetConfig }}
        {{- fail (printf "Invalid preset value '%s'. Valid options: %s" .preset (keys $presets | join ", ")) }}
      {{- end }}
      {{- toYaml $presetConfig | nindent 4 }}
    {{- end }}

    {{- if .custom.requests }}
    requests:
      {{- toYaml .custom.requests | nindent 6 }}
    {{- end }}

    {{- if .custom.limits }}
    limits:
      {{- toYaml .custom.limits | nindent 6 }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
