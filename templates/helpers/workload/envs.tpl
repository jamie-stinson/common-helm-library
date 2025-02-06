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
  - name: OPERATOR_NAMESPACE
    valueFrom:
      fieldRef:
        fieldPath: metadata.namespace
  - name: HOST_IP_ADDRESS
    valueFrom:
      fieldRef:
        fieldPath: status.hostIP
  - name: HOSTNAME
    valueFrom:
      fieldRef:
        fieldPath: spec.nodeName
  - name: NODE_NAME
    valueFrom:
      fieldRef:
        fieldPath: spec.nodeName
  - name: POD_IP
    valueFrom:
      fieldRef:
        fieldPath: status.podIP
  {{- range .envs }}
  - name: {{ .name }}
    value: {{ .value }}
  {{- end }}
  {{- range .envsConfigMap }}
  - name: {{ .name }}
    valueFrom:
      configMapKeyRef:
        name: {{ .configMap }}
        key: {{ .key }}
  {{- end }}
  {{- range .envsSecret }}
  - name: {{ .name }}
    valueFrom:
      secretKeyRef:
        name: {{ .secret }}
        key: {{ .key }}
  {{- end }}
{{- end }}
