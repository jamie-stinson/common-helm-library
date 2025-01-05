{{- define "common-helm-library.helpers.workload.securityContext" }}
{{- with .securityContext }}
securityContext:
  {{- with .readOnlyRootFilesystem }}
  readOnlyRootFilesystem: {{ . }}
  {{- end }}
  {{- with .allowPrivilegeEscalation }}
  allowPrivilegeEscalation: {{ . }}
  {{- end }}
  capabilities:
    drop:
      - ALL
    {{- with .capabilities }}
    add:
      {{- range . }}
      - {{ . }}
      {{- end }}
    {{- end }}
  {{- with .priviledged }}
  privileged: {{ . }}
  {{- end }}
  {{- with .runAsUser }}
  runAsUser: {{ . }}
  {{- end }}
  {{- with .runAsGroup }}
  runAsGroup: {{ . }}
  {{- end }}
  {{- with .runAsNonRoot }}
  runAsNonRoot: {{ . }}
  {{- end }}
{{- end }}
{{- end }}
