{{- define "common-helm-library.helpers.workload.image" }}
image: "{{ .image.registry }}/{{ .image.repository }}:{{ .image.tag }}{{- if .image.digest }}@{{ .image.digest }}{{- end }}"
{{- with .imagePullPolicy }}  
imagePullPolicy: {{ . }}
{{- end }}
{{- end }}
