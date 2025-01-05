{{- define "common-helm-library.helpers.service.loadBalancerIP" }}
{{- with .loadBalancerIP }}
loadBalancerIP: {{ . }}
{{- end }}
{{- end }}
