{{- define "common-helm-library.resources.role" }}
{{- if .Values.rbac.enabled }}
apiVersion: rbac.authorization.k8s.io/v1
kind: {{ .Values.rbac.type }}
metadata:
  name: {{ .Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.labels" . | indent 4 }}
    {{- if .Values.serviceAccount.labels }}
    {{- toYaml .Values.serviceAccount.labels | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.annotations" . | indent 4 }}
    {{- if .Values.serviceAccount.annotations }}
    {{- toYaml .Values.serviceAccount.annotations | nindent 4 }}
    {{- end }}
rules:
{{- toYaml .Values.rbac.rules | nindent 2 }}
{{- end }}
---
{{- end }}
