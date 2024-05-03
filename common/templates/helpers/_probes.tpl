{{ define "common-helm-library.probes" }}
  {{- if .Values.probes.startupProbe.enabled }}
  startupProbe:
  {{- include "common-helm-library.probeSettings" .Values.probes.startupProbe }}
  {{- end }}

  {{- if .Values.probes.livenessProbe.enabled }}
  livenessProbe:
  {{- include "common-helm-library.probeSettings" .Values.probes.livenessProbe }}
  {{- end }}

  {{- if .Values.probes.readinessProbe.enabled }}
  readinessProbe:
  {{- include "common-helm-library.probeSettings" .Values.probes.readinessProbe }}
  {{- end }}
{{ -end }}

{{/*
Settings for readiness, liveness and startup probes
*/}}

{{ define "common-helm-library.probeSettings" }}
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