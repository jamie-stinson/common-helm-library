{{- define "common-helm-library.helpers.workload.image" }}
image: "{{ .image.registry }}/{{ .image.repository }}:{{ .image.tag }}"
{{- with .imagePullPolicy }}  
imagePullPolicy: {{ . }}
{{- end }}
{{- end }}
