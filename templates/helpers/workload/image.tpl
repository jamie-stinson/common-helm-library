{{- define "common-helm-library.helpers.workload.image" }}
image: "{{ .Values.workload.image.registry }}/{{ .Values.workload.image.repository }}:{{ .Values.workload.image.tag }}"
{{- if .Values.workload.image.imagePullPolicy }}  
imagePullPolicy: {{ .Values.workload.image.imagePullPolicy }}
{{- end }}
{{- end }}
