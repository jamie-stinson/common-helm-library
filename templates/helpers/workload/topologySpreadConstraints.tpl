{{- define "common-helm-library.helpers.workload.topologyspreadconstraints" }}
{{- with .Values.workload.topologySpreadConstraints }}
topologySpreadConstraints:
  {{- toYaml . | nindent 2 }}
    labelSelector:
      matchLabels:
        {{- include "common-helm-library.helpers.metadata.selector-labels" $ | indent 8 }}
{{- end }}
{{- end }}
