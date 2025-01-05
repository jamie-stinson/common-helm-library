{{- define "common-helm-library.resources.roleBinding" }}
{{- if and .Values.rbac.enabled .Values.serviceAccount.enabled }}
{{- with .Values.rbac.roles }}
{{- range $roleType, $role := . }}
apiVersion: rbac.authorization.k8s.io/v1
kind: {{ $roleType | title }}Binding
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
roleRef:
  kind: {{ $roleType | title }}
  name: {{ $.Release.Name }}
  apiGroup: rbac.authorization.k8s.io
subjects:
- kind: ServiceAccount
  name: {{ $.Release.Name }}
  namespace: {{ $.Release.Namespace }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}
