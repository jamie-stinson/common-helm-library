{{ define "common-helm-library.helpers.containers.probe-settings" }}
      {{- $probeType := .type -}}
      {{- $valid := list "httpGet" "tcpSocket" "exec" }}
      {{- if not (has $probeType $valid) }}
      {{- fail "Invalid probe type, must be one of (httpGet,tcpSocket,exec)" }}
      {{- end }}
      {{ $probeType }}:
        {{- if eq $probeType "httpGet" }}
        path: {{ .path }}
        port: {{ .port }}
        {{- if .host }}
        host: {{ .host }}
        {{- end }}
        {{- if .httpHeaders }}
        httpHeaders: {{ toYaml .httpHeaders | nindent 6 }}
        {{- end }}
        {{- if .scheme }}
        scheme: {{ .scheme }}
        {{- end }}
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