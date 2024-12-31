{{- define "common-helm-library.resources.roleBinding" }}
{{- if and .Values.rbac.enabled .Values.serviceAccount.enabled }}
apiVersion: rbac.authorization.k8s.io/v1
kind: {{ .Values.rbac.type }}Binding
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
roleRef:
  kind: {{ .Values.rbac.type }}
  name: {{ .Release.Name }}
  apiGroup: rbac.authorization.k8s.io
subjects:
- kind: ServiceAccount
  name: {{ .Release.Name }}
  namespace: {{ .Release.Namespace }}
---
{{- end }}
{{- end }}
