{{- define "common-helm-library.extensions.redis.serviceaccount" }}
{{- if .Values.redis.enabled }}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ .Release.Name }}-redis
---
{{- end }}
{{- end }}
