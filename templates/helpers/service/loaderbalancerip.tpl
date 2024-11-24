{{- define "common-helm-library.helpers.service.loadbalancerip" }}
{{- if and (eq .Values.service.type "LoadBalancer") .Values.service.loadBalancerIP }}
loadBalancerIP: {{ .loadBalancerIP }}
{{- end }}
{{- end }}
