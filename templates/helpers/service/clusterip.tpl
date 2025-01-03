{{- define "common-helm-library.helpers.service.clusterip" }}
{{- if .clusterIP }}
clusterIP: {{ .clusterIP}}
{{- end }}
{{- end }}
