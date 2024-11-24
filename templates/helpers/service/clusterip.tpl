{{- define "common-helm-library.helpers.service.clusterip" }}
{{- if and (eq .Values.service.type "ClusterIP") .Values.service.clusterIP }}
clusterIP: {{ .Values.service.clusterIP}}
{{- end }}
{{- end }}
