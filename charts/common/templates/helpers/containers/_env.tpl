{{- define "common-helm-library.helpers.containers.env" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
env:
  - name: POD_NAME
    valueFrom:
      fieldRef:
        fieldPath: metadata.name
  # thanos-query and receive-ingestor
  - name: HOST_IP_ADDRESS
    valueFrom:
      fieldRef:
        fieldPath: status.hostIP
  # receive-ingestor
  - name: NAME
    valueFrom:
      fieldRef:
        fieldPath: metadata.name
  - name: NAMESPACE
    valueFrom:
      fieldRef:
        fieldPath: metadata.namespace
  {{- range .Values.containerEnvs }}
  - name: {{ .name }}
    value: {{ .value | quote }}
  {{- end }}
  {{- range .Values.containerEnvsConfigMap }}
  - name: {{ .name }}
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