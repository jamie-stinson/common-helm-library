{{- define "common-helm-library.extensions.postgres.service" }}
{{- if .Values.postgres.enabled }}
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-postgres
  labels:
    app.kubernetes.io/name: {{ .Release.Name }}-postgres
    app.kubernetes.io/instance: {{ .Release.Name }}-postgres
    app.kubernetes.io/managed-by: {{ .Release.Service }}
spec:
  type: ClusterIP
  selector:
    app.kubernetes.io/name: {{ .Release.Name }}-postgres
    app.kubernetes.io/instance: {{ .Release.Name }}-postgres
  ports:
    - name: postgresql
      port: 5432
      targetPort: 5432
---
{{- end }}
{{- end }}
