{{- define "common-helm-library.extensions.redis.statefulset" }}
{{- if .Values.redis.enabled }}
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: {{ .Release.Name }}-redis
spec:
  podManagementPolicy: OrderedReady
  serviceName: {{ .Release.Name }}-redis
  replicas: {{ .Values.redis.replicas }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ .Release.Name }}-redis
      app.kubernetes.io/instance: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ .Release.Name }}-redis
        app.kubernetes.io/instance: {{ .Release.Name }}
    spec:
      serviceAccountName: "{{ .Release.Name }}-redis"
      terminationGracePeriodSeconds: 10
      initContainers:
        - name: init-redis-cluster
          image: busybox:1.28
          command:
            - sh
            - -c
            - >
              until nslookup {{ .Release.Name }}-redis.$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace).svc.cluster.local;
              do echo waiting for redis-cluster; sleep 2; done
      containers:
        - name: redis
          image: "docker.io/redis:7.2.4-alpine"
          env:
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: NODE_NAME
              valueFrom:
                fieldRef:
                  fieldPath: spec.nodeName
            - name: POD_IP
              valueFrom:
                fieldRef:
                  fieldPath: status.podIP
            - name: NUM_SHARDS
              value: {{ .Values.redis.shards }}
          command:
            - sh
          args:
            - /conf/bootstrap-pod.sh
          ports:
            - name: client
              containerPort: 6379
            - name: gossip
              containerPort: 16379
          securityContext:
            runAsUser: 999
            runAsGroup: 999
            runAsNonRoot: true
            allowPrivilegeEscalation: false
            privileged: false
            readOnlyRootFilesystem: true
            seccompProfile:
              type: RuntimeDefault
            capabilities:
              add:
                - SYS_RESOURCE
                - IPC_LOCK
              drop:
                - ALL
          readinessProbe:
            exec:
              command:
                - sh
                - -c
                - redis-cli -h $(hostname) ping
            initialDelaySeconds: 5
            periodSeconds: 20
            timeoutSeconds: 5
            successThreshold: 1
            failureThreshold: 3
          livenessProbe:
            exec:
              command:
                - sh
                - -c
                - redis-cli -h $(hostname) ping
            initialDelaySeconds: 20
            periodSeconds: 3
            timeoutSeconds: 5
            successThreshold: 1
            failureThreshold: 3
          volumeMounts:
            - name: config
              mountPath: /conf
              readOnly: true
            - name: podinfo
              mountPath: /etc/podinfo
              readOnly: true
      volumes:
        - name: config
          configMap:
            name: {{ .Release.Name }}-redis
            items:
              - key: redis.conf
                path: redis.conf
              - key: bootstrap-pod.sh
                path: bootstrap-pod.sh
        - name: podinfo
          downwardAPI:
            items:
              - path: labels
                fieldRef:
                  fieldPath: metadata.labels
              - path: annotations
                fieldRef:
                  fieldPath: metadata.annotations
              - path: pod_name
                fieldRef:
                  fieldPath: metadata.name
              - path: pod_namespace
                fieldRef:
                  fieldPath: metadata.namespace
---
{{- end }}
{{- end }}
