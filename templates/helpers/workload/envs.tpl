{{- define "common-helm-library.helpers.workload.envs" }}
env:
  {{- $standardVars := list
    (dict "name" "NAME" "fieldPath" "metadata.name")
    (dict "name" "POD_NAME" "fieldPath" "metadata.name")
    (dict "name" "NAMESPACE" "fieldPath" "metadata.namespace")
    (dict "name" "POD_NAMESPACE" "fieldPath" "metadata.namespace")
    (dict "name" "OPERATOR_NAMESPACE" "fieldPath" "metadata.namespace")
    (dict "name" "HOST_IP_ADDRESS" "fieldPath" "status.hostIP")
    (dict "name" "HOSTNAME" "fieldPath" "spec.nodeName")
    (dict "name" "NODE_NAME" "fieldPath" "spec.nodeName")
    (dict "name" "POD_IP" "fieldPath" "status.podIP")
  }}
  {{- $disableDefaultEnv := .disableDefaultEnv | default list }}

  {{- range $standardVars }}
    {{- $varName := .name }}
    {{- $isDisabled := false }}
    {{- range $disableDefaultEnv }}
      {{- if eq $varName . }}
        {{- $isDisabled = true }}
        {{- break }}
      {{- end }}
    {{- end }}
    {{- if not $isDisabled }}
  - name: {{ $varName }}
    valueFrom:
      fieldRef:
        fieldPath: {{ .fieldPath }}
    {{- end }}
  {{- end }}

  {{- range .envs }}
  - name: {{ .name }}
    value: {{ .value | quote }}
  {{- end }}
  {{- range .envsFromField }}
  - name: {{ .name }}
    valueFrom:
      fieldRef:
        fieldPath: {{ .fieldPath }}
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
