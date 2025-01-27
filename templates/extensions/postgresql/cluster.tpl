{{- define "common-helm-library.extensions.postgres.cluster" }}
{{- if .Values.postgres.enabled }}
{{- with .Values.postgres }}
apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: {{ $.Release.Name }}-database
spec:
  instances: {{ .replicas }}
  imageName: ghcr.io/cloudnative-pg/postgresql:{{ .version }}
  bootstrap:
    initdb:
      database: {{ $.Release.Name }}
      owner: {{ $.Release.Name }}
  primaryUpdateStrategy: unsupervised
  enableSuperuserAccess: false
  storage:
    size: {{ .size }}
---
{{- end }}
{{- end }}
{{- end }}
