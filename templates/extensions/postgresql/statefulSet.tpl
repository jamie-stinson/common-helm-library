{{- define "common-helm-library.extensions.postgres.statefulset" }}
{{- if .Values.postgres.enabled }}
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: {{ .Release.Name }}-postgres
spec:
  podManagementPolicy: OrderedReady
  serviceName: {{ .Release.Name }}-postgres
  replicas: {{ .Values.postgres.replicas }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ .Release.Name }}-postgres
      app.kubernetes.io/instance: {{ .Release.Name }}-postgres
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ .Release.Name }}-postgres
        app.kubernetes.io/instance: {{ .Release.Name }}-postgres
    spec:
      terminationGracePeriodSeconds: 10
      containers:
        - name: postgres
          image: "docker.io/postgres:17.2"
          env:
            - name: POSTGRES_USER
              value: "{{ .Release.Name }}"
            - name: POSTGRES_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: {{ .Release.Name }}-postgres
                  key: POSTGRES_PASSWORD
            - name: POSTGRES_DB
              value: "{{ .Release.Name }}"
          ports:
            - name: postgresql
              containerPort: 5432
              protocol: TCP
          readinessProbe:
            tcpSocket:
              port: 5432
            initialDelaySeconds: 10
            timeoutSeconds: 5
          livenessProbe:
            tcpSocket:
              port: 5432
            initialDelaySeconds: 10
            timeoutSeconds: 5
          volumeMounts:
            - name: init-scripts
              mountPath: /docker-entrypoint-initdb.d
      volumes:
        - name: init-scripts
          configMap:
            name: {{ .Release.Name }}-postgres
---
{{- end }}
{{- end }}
