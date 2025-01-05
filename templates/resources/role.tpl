{{- define "common-helm-library.resources.role" }}
{{- if .Values.rbac.enabled }}
{{- with .Values.rbac.roles }}
{{- $validTypes := dict "role" true "clusterRole" true }}
{{- range $roleType, $role := . }}
  {{- if not (hasKey $validTypes $roleType) }}
    {{- fail "Invalid RBAC type, must be one of (role, clusterRole)" }}
  {{- end }}
apiVersion: rbac.authorization.k8s.io/v1
kind: {{ $roleType | title }}
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
rules:
  {{- toYaml $role.rules | nindent 2 }}
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}
