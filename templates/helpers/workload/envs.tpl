{{- define "common-helm-library.helpers.workload.envs" }}
env:
  - name: NAME
    valueFrom:
      fieldRef:
        fieldPath: metadata.name
  - name: POD_NAME
    valueFrom:
      fieldRef:
        fieldPath: metadata.name
  - name: NAMESPACE
    valueFrom:
      fieldRef:
        fieldPath: metadata.namespace
  - name: POD_NAMESPACE
    valueFrom:
      fieldRef:
        fieldPath: metadata.namespace
  - name: HOST_IP_ADDRESS
    valueFrom:
      fieldRef:
        fieldPath: status.hostIP
  {{- range .Values.workload.envs }}
  - name: {{ .name }}
    value: {{ .value }}
  {{- end }}
  {{- range .Values.workload.envsConfigMap }}
  - name: {{ .name }}
    valueFrom:
      configMapKeyRef:
        name: {{ .configMap }}
        key: {{ .key }}
  {{- end }}
  {{- range .Values.workload.envsSecret }}
  - name: {{ .name }}
    valueFrom:
      secretKeyRef:
        name: {{ .secret }}
        key: {{ .key }}
  {{- end }}
{{- end }}
