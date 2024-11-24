{{- define "common-helm-library.helpers.workload.probes" }}
{{- $probes := .Values.workload.probes -}}
{{- $valid := dict "httpGet" true "tcpSocket" true "exec" true }}
{{- range $probeType, $probe := $probes }}
{{- if $probe }}
{{ $probeType }}:
  {{- $type := $probe.type }}
  {{- if not (hasKey $valid $type) }}
    {{- fail "Invalid probe type, must be one of (httpGet,tcpSocket,exec)" }}
  {{- end }}
  {{ $type }}:
    {{- if eq $type "httpGet" }}
    path: {{ $probe.path }}
    port: {{ $probe.port }}
    {{- if $probe.host }}
    host: {{ $probe.host }}
    {{- end }}
    {{- if $probe.httpHeaders }}
    httpHeaders: {{ toYaml $probe.httpHeaders | nindent 6 }}
    {{- end }}
    {{- if $probe.scheme }}
    scheme: {{ $probe.scheme }}
    {{- end }}
    {{- end }}
    {{- if eq $type "tcpSocket" }}
    port: {{ $probe.port }}
    {{- if $probe.host }}
    host: {{ $probe.host }}
    {{- end }}
    {{- end }}
    {{- if eq $type "exec" }}
    command: {{ toYaml $probe.command | nindent 6 }}
    {{- end }}
  periodSeconds: {{ $probe.periodSeconds }}
  timeoutSeconds: {{ $probe.timeoutSeconds }}
  successThreshold: {{ $probe.successThreshold }}
  failureThreshold: {{ $probe.failureThreshold }}
  initialDelaySeconds: {{ $probe.initialDelaySeconds }}
{{- end }}
{{- end }}
{{- end }}

