{{/*
Merge the local chart values and the common chart defaults
*/}}
{{- define "common-helm-library.helpers.chart.merge-values" -}}
  {{- $defaultValues := deepCopy .Values -}}
  {{- $mergedValues := mustMergeOverwrite $defaultValues -}}
  {{- $_ := set . "Values" (deepCopy $mergedValues) -}}
{{- end -}}