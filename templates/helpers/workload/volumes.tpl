{{- define "common-helm-library.helpers.workload.volumes" }}
{{- with .storage }}
volumes:
  {{- range . }}
  - name: {{ .name }}
  {{- if eq .type "configMap" }}
    configMap:
      name: {{ .configMapName }}
      {{- range .items }}
      items:
      - key: {{ .key }}
        path: {{ .path }}
      {{- end }}
  {{- else if eq .type "secret" }}
    secret:
      secretName: {{ .secretName }}
      {{- range .items }}
      items:
      - key: {{ .key }}
        path: {{ .path }}
      {{- end }}
  {{- else if eq .type "emptyDir" }}
    emptyDir:
      {{- if .ramDisk }}
      medium: "Memory"
      {{- end }}
      sizeLimit: {{ .sizeLimit }}
  {{- else if eq .type "hostPath" }}
    hostPath:
      path: {{ .hostPath }}
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
