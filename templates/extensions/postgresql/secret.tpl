{{- define "common-helm-library.extensions.postgres.secret" }}
{{- if .Values.postgres.enabled }}
apiVersion: v1
kind: Secret
metadata:
  name: {{ .Release.Name }}-postgres
  labels:
    app.kubernetes.io/name: {{ .Release.Name }}-postgres
    app.kubernetes.io/instance: {{ .Release.Name }}-postgres
type: Opaque
data:
  POSTGRES_PASSWORD: {{ randAlphaNum 16 | b64enc }}
{{- end }}
{{- end }}
