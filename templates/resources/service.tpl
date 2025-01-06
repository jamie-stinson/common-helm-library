{{- define "common-helm-library.resources.service" }}
{{- if .Values.service.enabled }}
{{- with .Values.service }}
apiVersion: v1
kind: Service
metadata:
  name: {{ .name | default $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  type: {{ .type }}
  selector:
    {{- include "common-helm-library.helpers.metadata.commonSelectorLabels" $ | indent 4 }}
  {{- include "common-helm-library.helpers.service.loadBalancerIP" . | indent 2 }}
  {{- include "common-helm-library.helpers.service.clusterIP" . | indent 2 }}
  {{- include "common-helm-library.helpers.service.ports" . | indent 2 }}
---
{{- end }}
{{- end }}
{{- if eq .Release.Name "traefik" }}
apiVersion: v1
kind: Service
metadata:
  name: {{ $.Release.Name }}-external
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  type: NodePort
  selector:
    {{- include "common-helm-library.helpers.metadata.commonSelectorLabels" $ | indent 4 }}
  ports:
    - name: web
      protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30080
    - name: websecure
      protocol: TCP
      port: 443
      targetPort: 443
      nodePort: 30443
---
{{- end }}
{{- end }}
