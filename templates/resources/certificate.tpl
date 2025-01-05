{{- define "common-helm-library.resources.certificate" }}
{{- if .Values.wildcardCertificate.enabled }}
{{- with .Values.wildcardCertificate }}
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ $.Release.Name }}
  labels:
    {{- include "common-helm-library.helpers.metadata.commonLabels" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceLabels" . | indent 4 }}
  annotations:
    {{- include "common-helm-library.helpers.metadata.commonAnnotations" $ | indent 4 }}
    {{- include "common-helm-library.helpers.metadata.resourceAnnotations" . | indent 4 }}
spec:
  secretName: "{{ .issuer }}-{{ .domain | replace "." "" }}-certificate"
  dnsNames:
    - '{{ .domain }}'
    - '*.{{ .domain }}'
  issuerRef:
    name: "{{ .issuer }}-{{ .domain | replace "." "" }}-issuer"
    kind: ClusterIssuer
  secretTemplate:
    annotations:
      reflector.v1.k8s.emberstack.com/reflection-allowed: "true"  
      reflector.v1.k8s.emberstack.com/reflection-allowed-namespaces: ""
      reflector.v1.k8s.emberstack.com/reflection-auto-enabled: "true"
      reflector.v1.k8s.emberstack.com/reflection-allowed-namespaces: ""
---
{{- end }}
{{- end }}
{{- end }}
