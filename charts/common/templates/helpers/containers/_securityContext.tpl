{{ define "common-helm-library.helpers.containers.securityContext" }}
securityContext:
  readOnlyRootFilesystem: {{ .Values.securityContext.readOnlyRootFilesystem }}
  allowPrivilegeEscalation: {{ .Values.securityContext.allowPrivilegeEscalation }}
  capabilities:
      drop:
      - ALL
      add:
  {{- range .Values.securityContext.capabilities }}
      - {{ . }}
  {{- end }}     
  privileged: {{ .Values.securityContext.privileged }}
  fsGroup: {{ .Values.securityContext.runAsUser }}
  runAsUser: {{ .Values.securityContext.runAsUser }}
  runAsGroup: {{ .Values.securityContext.runAsGroup }}
  runAsNonRoot: {{ .Values.securityContext.runAsNonRoot }}
  fsGroupChangePolicy: {{ .Values.securityContext.fsGroupChangePolicy }}
  seccompProfile: RuntimeDefault
{{- end }}

