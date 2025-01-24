{{- define "common-helm-library.extensions.postgres.configmap" }}
{{- if .Values.postgres.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-postgres
  labels:
    app.kubernetes.io/name: {{ .Release.Name }}-postgres
    app.kubernetes.io/instance: {{ .Release.Name }}-postgres
    app.kubernetes.io/managed-by: {{ .Release.Service }}
data:
  master-slave-config.sh: |
    HOST=`hostname -s`
    ORD=${HOST##*-}
    HOST_TEMPLATE=${HOST%-*}
    case $ORD in
      0)
      echo "host    replication     all     all     md5" >> /var/lib/postgresql/data/pg_hba.conf
      echo "archive_mode = on"  >> /etc/postgresql/postgresql.conf
      echo "archive_mode = on"  >> /etc/postgresql/postgresql.conf
      echo "archive_command = '/bin/true'"  >> /etc/postgresql/postgresql.conf
      echo "archive_timeout = 0"  >> /etc/postgresql/postgresql.conf
      echo "max_wal_senders = 8"  >> /etc/postgresql/postgresql.conf
      echo "wal_keep_segments = 32"  >> /etc/postgresql/postgresql.conf
      echo "wal_level = hot_standby"  >> /etc/postgresql/postgresql.conf
      psql -U {{ .Release.Name }} -c "GRANT ALL PRIVILEGES ON DATABASE {{ .Release.Name }} TO {{ .Release.Name }};"
      ;;
      *)
      # stop initial server to copy data
      pg_ctl -D /var/lib/postgresql/data/ -m fast -w stop
      rm -rf /var/lib/postgresql/data/*
      # add service name for DNS resolution
      PGPASSWORD=k8s-postgres-ha pg_basebackup -h ${HOST_TEMPLATE}-0.{{ .Release.Name }}-postgres.{{ .Release.Namespace }}.svc.cluster.local -w -U replicator -p 5432 -D /var/lib/postgresql/data -Fp -Xs -P -R
      # start server to keep container's screep happy
      pg_ctl -D /var/lib/postgresql/data/ -w start
      ;;
    esac
  create-replication-role.sql: |
    CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'k8s-postgres-ha';
  role-access.sql: |
    GRANT ALL PRIVILEGES ON DATABASE {{ .Release.Name }} TO {{ .Release.Name }};;
---
{{- end }}
{{- end }}
