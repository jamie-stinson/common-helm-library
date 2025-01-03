{{- define "common-helm-library.resources.service" }}
{{- range .Values.services}}
{{- if .enabled }}
apiVersion: v1
kind: Service
metadata:
  name: {{ $.Release.Name }}-{{ .name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.labels" $ | indent 4 }}
    {{- if .labels }}
    {{- toYaml .labels | nindent 4 }}
    {{- end }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.annotations" $ | indent 4 }}
    {{- if .annotations }}
    {{- toYaml .annotations | nindent 4 }}
    {{- end }}
spec:
  type: {{ .type }}
  selector:
    {{- include "common-helm-library.helpers.metadata.selector-labels" $ | indent 4 }}
  {{- include "common-helm-library.helpers.service.loadbalancerip" . | indent 2 }}
  {{- include "common-helm-library.helpers.service.clusterip" . | indent 2 }}
  {{- include "common-helm-library.helpers.service.ports" . | indent 2 }}
---
{{- end }}
{{- end }}
{{- end }}
