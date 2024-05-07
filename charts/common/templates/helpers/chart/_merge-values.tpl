{{/*
Merge the local chart values and the common chart defaults
*/}}
{{- define "common-helm-library.helpers.chart.merge-values" -}}
  {{- $fileContent := tpl (.Files.Get "values.yaml") . }}
  {{- $values := fromYaml $fileContent }}
{{- end -}}