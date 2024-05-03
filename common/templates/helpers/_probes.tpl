{{/*
Settings for readiness, liveness and startup probes
*/}}

{{ define "common-helm-library.probes" }}
  {{- $probeType := .type -}}
  {{- $valid := list "httpGet" "tcpSocket" "exec" }}
  {{- if not (has $probeType $valid) }}
  {{- fail "Invalid probe type, must be one of (httpGet,tcpSocket,exec)" }}
  {{- end }}
  {{ $probeType }}:
    {{- if eq $probeType "httpGet" }}
    path: {{ .path }}
    port: {{ .port }}
    host: {{ .host }}
    httpHeaders: {{ toYaml .httpHeaders | nindent 6 }}
    scheme: {{ .scheme }}
    {{- end }}
    {{- if eq $probeType "tcpSocket" }}
    port: {{ .port }}
    host: {{ .host }}
    {{- end }}
    {{- if eq $probeType "exec" }}
    command: {{ toYaml .command | nindent 6 }}
    {{- end }}
  periodSeconds: {{ .periodSeconds }}
  timeoutSeconds: {{ .timeoutSeconds }}
  successThreshold: {{ .successThreshold }}
  failureThreshold: {{ .failureThreshold }}
  initialDelaySeconds: {{ .initialDelaySeconds }}
  timeoutSeconds: {{ .timeoutSeconds }}
{{- end }}