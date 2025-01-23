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
      app.kubernetes.io/instance: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ .Release.Name }}-postgres
        app.kubernetes.io/instance: {{ .Release.Name }}
    spec:
      terminationGracePeriodSeconds: 10
      containers:
        - name: postgres
          image: "docker.io/postgres:17.2"
          env:
            - name: POSTGRES_PASSWORD
              value: "let-me-in"
          ports:
            - name: postgresql
              containerPort: 5432
              protocol: TCP
          livenessProbe:
            exec:
              command:
                - sh
                - -c
                - exec pg_isready --host $POD_IP
            failureThreshold: 6
            initialDelaySeconds: 60
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 5
          readinessProbe:
            exec:
              command:
                - sh
                - -c
                - exec pg_isready --host $POD_IP
            failureThreshold: 3
            initialDelaySeconds: 5
            periodSeconds: 5
            successThreshold: 1
            timeoutSeconds: 3
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
