{{- define "common-helm-library.helpers.containers.main" -}}
{{- $requiredMsg := include "common-helm-library.helpers.chart.check-required-value" . -}}
containers:
  - name: {{ required (printf $requiredMsg "name") .Values.name | quote }}
    image: "{{ .Values.image.registry }}/{{ .Values.image.repository }}:{{ .Values.image.tag }}"
    {{- if .Values.container.command }}  
    command:
      {{- toYaml .Values.container.command | nindent 12 }}
    {{- end }}
    {{- if .Values.containerArgs }}
    args:
      {{- toYaml .Values.containerArgs | nindent 4 }}
    {{- end }}
    imagePullPolicy: {{ .Values.container.imagePullPolicy | quote }}
    {{ include "common-helm-library.helpers.containers.securityContext" . | nindent 4 }}
    {{ include "common-helm-library.helpers.containers.env" . | nindent 4 }}
    {{- if .Values.resources }}
    resources:
      requests:
        cpu: {{ .Values.resources.requests.cpu }}
        memory: {{ .Values.resources.requests.memory }}
      limits:
        cpu: {{ .Values.resources.limits.cpu }}
        memory: {{ .Values.resources.limits.memory }}
    {{- end }}
    {{- range .Values.services }}
    ports:
      {{- range .ports }}
      - name: {{ .name }}
        containerPort: {{ .port }}
      {{- end }}
    {{- end }}
    {{- if .Values.probes.startupProbe }}
    startupProbe:
    {{- include "common-helm-library.helpers.containers.probe-settings" .Values.probes.startupProbe }}
    {{- end }}
    {{- if .Values.probes.livenessProbe }}
    livenessProbe:
    {{- include "common-helm-library.helpers.containers.probe-settings" .Values.probes.livenessProbe }}
    {{- end }}
    {{- if .Values.probes.readinessProbe }}
    readinessProbe:
    {{- include "common-helm-library.helpers.containers.probe-settings" .Values.probes.readinessProbe }}
    {{- end }}
    {{- if .Values.storage }}
    volumeMounts:
    - name: tmp
      mountPath: "/tmp"
    {{- range .Values.storage }}
    - name: {{ .name }}
      mountPath: {{ .mountPath }}
      {{- if .readOnly }}
      readOnly: {{ .readOnly }}
      {{- end }}
      {{- if .mountPropagation }}
      mountPropagation: {{ .mountPropagation }}
      {{- end }}
      {{- end }}
    {{- end }}
{{- if .Values.additionalContainers }}
  {{- toYaml .Values.additionalContainers | nindent 2 }} 
{{- end }}
{{- end }}