{{- define "common-helm-library.helpers.service.loadbalancerip" }}
{{- if .loadBalancerIP }}
loadBalancerIP: {{ .loadBalancerIP }}
{{- end }}
{{- end }}
