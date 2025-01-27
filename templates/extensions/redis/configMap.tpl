{{- define "common-helm-library.extensions.redis.configmap" }}
{{- if .Values.redis.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-redis
  labels:
    app.kubernetes.io/name: {{ .Release.Name }}-redis
    app.kubernetes.io/instance: {{ .Release.Name }}-redis
    app.kubernetes.io/managed-by: {{ .Release.Service }}
data:
  redis.conf: |
    cluster-enabled yes
    cluster-require-full-coverage no
    cluster-node-timeout 15000
    cluster-config-file nodes.conf
    cluster-migration-barrier 1 
    appendonly yes
    # Other cluster members need to be able to connect
    protected-mode no
  bootstrap-pod.sh: |
    #!/bin/sh
    set -ex

    # Find which member of the Stateful Set this pod is running
    # e.g. "redis-0" -> "0"
    PET_ORDINAL=$(cat /etc/podinfo/pod_name | rev | cut -d- -f1)
    MY_SHARD=$(($PET_ORDINAL % $NUM_SHARDS))

    redis-server /conf/redis.conf &

    # Wait until redis-server process is ready
    REDIS_READY=0

    # Loop until Redis server responds to commands
    while [ $REDIS_READY -eq 0 ]; do
      # Attempt to send a PING command to Redis using redis-cli
      # and check if the response is "PONG"
      if redis-cli PING | grep -q "PONG"; then
        # If Redis responds with PONG, it's ready.
        # Set the status to indicate this and break the loop.
        REDIS_READY=1
        echo "Redis server is ready."
      else
        # If Redis is not yet ready, wait for 5 seconds before retrying.
        echo "Waiting for Redis server to become ready..."
        sleep 5
      fi
    done

    if [ $PET_ORDINAL -lt $NUM_SHARDS ]; then
      # Set up primary nodes. Divide slots into equal(ish) contiguous blocks
      NUM_SLOTS=$(( 16384 / $NUM_SHARDS ))
      REMAINDER=$(( 16384 % $NUM_SHARDS ))
      START_SLOT=$(( $NUM_SLOTS * $MY_SHARD + ($MY_SHARD < $REMAINDER ? $MY_SHARD : $REMAINDER) ))
      END_SLOT=$(( $NUM_SLOTS * ($MY_SHARD+1) + ($MY_SHARD+1 < $REMAINDER ? $MY_SHARD+1 : $REMAINDER) - 1 ))

      PEER_IP=$(nslookup {{ .Release.Name }}-redis-0.{{ .Release.Name }}-redis.{{ .Release.Namespace }}.svc.cluster.local | awk '/^Address: / { print $2 }')
      redis-cli cluster meet $PEER_IP 6379
      redis-cli cluster addslots $(seq $START_SLOT $END_SLOT)
    else
      # Set up a replica
      PEER_IP=$(nslookup {{ .Release.Name }}-redis-$MY_SHARD.{{ .Release.Name }}-redis.{{ .Release.Namespace }}.svc.cluster.local | awk '/^Address: / { print $2 }')
      redis-cli --cluster add-node localhost:6379 $PEER_IP:6379 --cluster-slave
    fi

    wait
---
{{- end }}
{{- end }}
