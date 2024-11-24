{{- define "common-helm-library.helpers.workload.volumes" }}
{{- if .Values.workload.storage }}
volumes:
  {{- range .Values.workload.storage }}
  {{- if eq .type "configMap" }}
  - name: {{ .name }}
    configMap:
      name: {{ .configMapName }}
  {{- else if eq .type "secret" }}
  - name: {{ .name }}
    secret:
      secretName: {{ .secretName }}
  {{- else if eq .type "emptyDir" }}
  - name: {{ .name }}
    emptyDir:
      {{- if .ramDisk }}
      medium: "Memory"
      {{- end }}
      sizeLimit: {{ .sizeLimit }}
  {{- else if eq .type "hostPath" }}
  - name: {{ .name }}
    hostPath:
      path: {{ .hostPath }} 
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
      claimName: {{ .claimName }}
  {{- end }}
  {{- end }}
{{- end }}
{{- end }}
