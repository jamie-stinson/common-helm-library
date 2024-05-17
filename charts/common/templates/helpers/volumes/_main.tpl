{{- define "common-helm-library.helpers.volumes.main" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
{{- range .Values.storage }}
volumes:
{{- if eq .type "configMap" }}
- name: {{ .name }}
  configMap:
  name: {{ .configMapName }}
  items:
      {{- range .items }}
      - key: {{ .key }}
      path: {{ .path }}
      {{- end }}
{{- else if eq .type "hostPath" }}
- name: {{ .name }}
  hostPath:
    path: {{ .hostPath }} 
{{- else if eq .type "emptyDir" }}
- name: {{ .name }}
  emptyDir:
    {{- if .ramDisk }}
    medium: "Memory"
    {{- end }}
    {{- if .sizeLimit }}
    sizeLimit: {{ .sizeLimit }}
    {{- end }}
{{- else if eq .type "iscsi" }}   
- name: {{ .name }}
  iscsi:
    targetPortal: {{ .targetPortal }}
    portals: {{ .portals }}
    iqn: {{ .iqn }}
    lun: 0
    fsType: ext4
    readOnly: false
{{- else if eq .type "downwardAPI" }}
- name: {{ .name }}
  downwardAPI:
  items:
    {{- range .items }}
    - path: {{ .path }}
    fieldRef:
      fieldPath: {{ .fieldRef.fieldPath }}
    {{- end }}
{{- else if eq .type "pvc" }}
- name: {{ .name }}
  persistentVolumeClaim:
    claimName: {{ $.Release.Name }}-{{ .name }}
{{- else if eq .type "template" }}
persistentVolumeClaimRetentionPolicy:
  whenDeleted: Retain
  whenScaled: Retain
volumeClaimTemplates:
  - metadata:
      name: {{ .name }}
      spec:
      storageClassName: {{ .storageClass }}
      accessModes: {{ .accessModes | toYaml | nindent 10 }}
      resources:
          requests:
          storage: {{ .size }}   
{{- end }}
{{- end }}
{{- end }}