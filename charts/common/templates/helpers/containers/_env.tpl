{{- define "common-helm-library.helpers.containers.env" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
env:
  - name: POD_NAME
    valueFrom:
      fieldRef:
        fieldPath: metadata.name
  {{- if .Values.containerEnvs }}
  {{- range .Values.containerEnvs }}
  - name: {{ .name }}
    value: {{ .value | quote }}
  {{- end }}
  {{- end }}
  {{- if .Values.containerEnvsConfigMap }}
  {{- range .Values.containerEnvsConfigMap }}
  - name: {{ .name }}
    valueFrom:
    configMapKeyRef:
        name: {{ .configMap }}
        key: {{ .name }}
  {{- end }}
  {{- end }}
  {{- if .Values.containerEnvsSecret }}
  {{- range .Values.containerEnvsSecret }}
  - name: {{ .name }}
    valueFrom:
    secretKeyRef:
        name: {{ .secret }}
        key: {{ .key }}
  {{- end }}
  {{- end }}
{{- end }}