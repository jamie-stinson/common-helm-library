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
  runAsUser: {{ .Values.securityContext.runAsUser }}
  runAsGroup: {{ .Values.securityContext.runAsGroup }}
  runAsNonRoot: {{ .Values.securityContext.runAsNonRoot }}
  {{- if ne .Release.Name "traefik" }}  
  {{- if .Values.storage }}
  fsGroup: {{ .Values.securityContext.runAsUser }}
  fsGroupChangePolicy: {{ .Values.securityContext.fsGroupChangePolicy }}
  {{- end }}
  {{- end }}
{{- end }}