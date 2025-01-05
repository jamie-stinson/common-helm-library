{{- define "common-helm-library.helpers.service.clusterIP" }}
{{- with .clusterIP }}
clusterIP: {{ . }}
{{- end }}
{{- end }}
