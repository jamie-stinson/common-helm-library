{{- define "common-helm-library.resources.ingressClass" -}}
{{- if .Values.ingressClass.enabled }}
{{- with .Values.ingressClass }}
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  annotations:
    ingressclass.kubernetes.io/is-default-class: "{{ .isDefault }}"
  name: {{ $.Release.Name }}
spec:
  controller: "{{ .controller}}"
---
{{- end }}
{{- end }}
{{- end }}
