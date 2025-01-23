{{- define "common-helm-library.extensions.redis.service" }}
{{- if .Values.redis.enabled }}
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-redis
  labels:
    app.kubernetes.io/name: {{ .Release.Name }}-redis
    app.kubernetes.io/instance: {{ .Release.Name }}-redis
    app.kubernetes.io/managed-by: {{ .Release.Service }}
spec:
  type: ClusterIP
  selector:
    app.kubernetes.io/name: {{ .Release.Name }}-redis
    app.kubernetes.io/instance: {{ .Release.Name }}-redis
  clusterIP: None
  publishNotReadyAddresses: true
  ports:
  - name: client
    protocol: TCP
    port: 6379
  - name: gossip
    protocol: TCP
    port: 16379
---
{{- end }}
{{- end }}
