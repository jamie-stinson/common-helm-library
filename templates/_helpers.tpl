{{/*
A default message string to be used when checking for a required value
*/}}
{{- define "common-helm-library.check-required-value" -}}
{{- "No value found for '%s' in common-helm-library template" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "common-helm-library.labels" -}}
{{- $requiredMsg := include "common-helm-library.check-required-value" . -}}
app.kubernetes.io/name: {{ required (printf $requiredMsg "name") .Values.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "common-helm-library.selector-labels" -}}
{{- $requiredMsg := include "common-helm-library.check-required-value" . -}}
app.kubernetes.io/name: {{ required (printf $requiredMsg "name") .Values.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}