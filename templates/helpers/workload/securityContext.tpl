{{ define "common-helm-library.helpers.workload.securitycontext" }}
securityContext:
  readOnlyRootFilesystem: {{ .Values.workload.securityContext.readOnlyRootFilesystem }}
  allowPrivilegeEscalation: {{ .Values.workload.securityContext.allowPrivilegeEscalation }}
  capabilities:
    drop:
      - ALL
    {{- if .Values.workload.securityContext.capabilities }}
    add:
      {{- range .Values.workload.securityContext.capabilities }}
      - {{ . }}
      {{- end }}
    {{- end }}
  privileged: {{ .Values.workload.securityContext.privileged }}
  runAsUser: {{ .Values.workload.securityContext.runAsUser }}
  runAsGroup: {{ .Values.workload.securityContext.runAsGroup }}
  runAsNonRoot: {{ .Values.workload.securityContext.runAsNonRoot }}
{{- end }}
