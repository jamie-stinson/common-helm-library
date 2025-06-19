{{/*
Renders the image and imagePullPolicy for a workload.
*/}}
{{- define "common-helm-library.helpers.workload.image" -}}
image: "{{- if .image.registry -}}{{ .image.registry }}/{{- end -}}{{ .image.repository }}:{{ .image.tag }}{{- if .image.digest }}@{{ .image.digest }}{{- end -}}"
{{- with .imagePullPolicy }}
imagePullPolicy: {{ . }}
{{- end }}
{{- end -}}
