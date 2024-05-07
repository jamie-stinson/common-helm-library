{{/*
Merge the local chart values and the common chart defaults
*/}}
{{- define "common-helm-library.helpers.chart.merge-values" -}}
  {{- $indexValues := index .Values "helm-common" -}}
  {{- $common := dict "Values" $indexValues -}}
  {{- $noCommon := omit .Values "helm-common" -}}
  {{- $overrides := dict "Values" $noCommon -}}
  {{- $noValues := omit . "Values" -}}
  {{- with mergeOverwrite $noValues $common $overrides -}}
{{- end -}}