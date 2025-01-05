{{- define "common-helm-library.helpers.workload.probes" }}
{{- with .probes }}
{{- range $probeType, $probe := . }}
{{ $probeType }}:
  {{- $valid := dict "httpGet" true "tcpSocket" true "exec" true }}
  {{- if not (hasKey $valid $probe.type) }}
    {{- fail "Invalid probe type, must be one of (httpGet, tcpSocket, exec)" }}
  {{- end }}
  {{ $probe.type }}:
    {{- if eq $probe.type "httpGet" }}
    path: {{ $probe.path | quote }}
    port: {{ $probe.port }}
    {{- if $probe.host }}
    host: {{ $probe.host | quote }}
    {{- end }}
    {{- if $probe.httpHeaders }}
    httpHeaders:
    {{- range $headerName, $headerValue := $probe.httpHeaders }}
      - name: {{ $headerName | quote }}
        value: {{ $headerValue | quote }}
    {{- end }}
    {{- end }}
    {{- if $probe.scheme }}
    scheme: {{ $probe.scheme | quote }}
    {{- end }}
    {{- end }}
    {{- if eq $probe.type "tcpSocket" }}
    port: {{ $probe.port }}
    {{- if $probe.host }}
    host: {{ $probe.host | quote }}
    {{- end }}
    {{- end }}
    {{- if eq $probe.type "exec" }}
    command:
    {{- range $probe.command }}
      - {{ . | quote }}
    {{- end }}
    {{- end }}
  periodSeconds: {{ $probe.periodSeconds }}
  timeoutSeconds: {{ $probe.timeoutSeconds }}
  successThreshold: {{ $probe.successThreshold }}
  failureThreshold: {{ $probe.failureThreshold }}
  initialDelaySeconds: {{ $probe.initialDelaySeconds }}
{{- end }}
{{- end }}
{{- end }}
