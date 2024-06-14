{{- define "common-helm-library.helpers.volumes.main" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
{{- if .Values.storage }}
volumes:
- name: tmp
  emptyDir:
    sizeLimit: 1Gi
{{- range .Values.storage }}
- name: {{ .name }}
{{- if eq .type "configMap" }}
  configMap:
    name: {{ .configMapName }}
{{- else if eq .type "hostPath" }}
  hostPath:
    path: {{ .hostPath }} 
{{- else if eq .type "emptyDir" }}
  emptyDir:
    {{- if .ramDisk }}
    medium: "Memory"
    {{- end }}
    {{- if .size }}
    sizeLimit: {{ .size }}
    {{- end }}
{{- else if eq .type "iscsi" }}   
  iscsi:
    targetPortal: {{ .targetPortal }}
    portals: {{ .portals }}
    iqn: {{ .iqn }}
    lun: {{ .lun }}
    fsType: {{ .fsType }}
    readOnly: {{ .readOnly }}
{{- else if eq .type "secret" }}   
  secret:
    secretName: {{ .secretName }}
{{- else if eq .type "downwardAPI" }}
  downwardAPI:
  items:
    {{- range .items }}
    - path: {{ .path }}
    fieldRef:
      fieldPath: {{ .fieldRef.fieldPath }}
    {{- end }}
{{- else if eq .type "pvc" }}
  persistentVolumeClaim:
    claimName: {{ .claimName }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}