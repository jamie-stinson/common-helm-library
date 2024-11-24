{{- define "common-helm-library.resources.service" }}
{{- if .Values.service.enabled }}
apiVersion: v1
kind: Service
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
spec:
  type: {{ .Values.service.type }}
  selector:
    {{- include "common-helm-library.helpers.metadata.selector-labels" . | indent 4 }}
  {{- include "common-helm-library.helpers.service.loadbalancerip" . | indent 2 }}
  {{- include "common-helm-library.helpers.service.clusterip" . | indent 2 }}
  {{- include "common-helm-library.helpers.service.ports" . | indent 2 }}
---
{{- end }}
{{- end }}
