{{- define "common-helm-library.helpers.workload.topologySpreadConstraints" }}
{{- with .Values.workload.topologySpreadConstraints }}
topologySpreadConstraints:
  {{- if eq .preset "spread-across-nodes" }}
  - maxSkew: 1
    topologyKey: kubernetes.io/hostname
    whenUnsatisfiable: ScheduleAnyway
    labelSelector:
      matchLabels:
        app.kubernetes.io/name: {{ $.Release.Name }}
  {{- end }}
  {{- if .custom }}
  {{- toYaml .custom | nindent 2 }}
  {{- end }}
{{- end }}
{{- end }}
