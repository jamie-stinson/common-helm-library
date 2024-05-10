{{- define "common-helm-library.helpers.containers.main" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
containers:
- name: {{ required (printf $requiredMsg "name") .Values.name | quote }}
  image: "{{ .Values.image.registry }}/{{ .Values.image.repository }}:{{ .Values.image.tag }}"
  {{- if .Values.container.command }}  
  command:
    {{- toYaml .Values.container.command | nindent 12 }}
  {{- end }}
  {{- if .Values.container.args }}
  args:
    {{- toYaml .Values.container.args | nindent 12 }}
  {{- end }}
  imagePullPolicy: {{ .Values.container.imagePullPolicy | default "Always" | quote }}
    
  {{ include "common-helm-library.helpers.containers.securityContext" . | nindent 2 }}
  {{ include "common-helm-library.helpers.containers.env" . | nindent 2 }}

  resources:
    requests:
      cpu: {{ .Values.resources.requests.cpu }}
      memory: {{ .Values.resources.requests.memory }}
    limits:
      cpu: {{ .Values.resources.limits.cpu }}
      memory: {{ .Values.resources.limits.memory }}

  {{- if .Values.service.enabled }}
  ports:
    {{- range .Values.service.ports }}
    - name: {{ .name }}
      containerPort: {{ .port }}
    {{- end }}
  {{- end }}

  {{- if .Values.probes.startupProbe.enabled }}
  startupProbe:
  {{- include "common-helm-library.helpers.containers.probe-settings" .Values.probes.startupProbe }}
  {{- end }}

  {{- if .Values.probes.livenessProbe.enabled }}
  livenessProbe:
  {{- include "common-helm-library.helpers.containers.probe-settings" .Values.probes.livenessProbe }}
  {{- end }}

  {{- if .Values.probes.readinessProbe.enabled }}
  readinessProbe:
  {{- include "common-helm-library.helpers.containers.probe-settings" .Values.probes.readinessProbe }}
  {{- end }}
  {{- if .Values.storage.enabled }}
  volumeMounts:
  {{- range .Values.storage.volumes }}
  - name: {{ .name }}
    mountPath: {{ .mountPath }}
    readOnly: {{ .readOnly }}
  {{- end }}
  {{- end }}
{{- end }}