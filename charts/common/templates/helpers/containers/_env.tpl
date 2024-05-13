{{- define "common-helm-library.helpers.containers.env" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
env:
  - name: POD_NAME
    valueFrom:
      fieldRef:
        fieldPath: metadata.name
  {{- range .Values.containerEnvs }}
  - name: {{ .name }}
    value: {{ .value | quote }}
  {{- end }}
  {{- range .Values.containerEnvsConfigMap }}
  - name: {{ .key }}
    valueFrom:
      configMapKeyRef:
          name: {{ .configMap }}
          key: {{ .key }}
  {{- end }}
  {{- range .Values.containerEnvsSecret }}
  - name: {{ .name }}
    valueFrom:
    secretKeyRef:
        name: {{ .secret }}
        key: {{ .key }}
  {{- end }}
{{- end }}