# common-helm-library

![Version: 1.0.58](https://img.shields.io/badge/Version-1.0.58-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square)

A Helm library chart

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| container.command | object | `{}` |  |
| container.limitCpu | string | `"10m"` |  |
| container.limitMemory | string | `"100Mi"` |  |
| container.requestCpu | string | `"10M"` |  |
| container.requestMemory | string | `"100Mi"` |  |
| deployment.minReadySeconds | int | `0` |  |
| deployment.replicas | int | `1` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `"latest"` |  |
| name | string | `"example"` | name of the application |
| probes.livenessProbe.enabled | bool | `false` |  |
| probes.readinessProbe.enabled | bool | `false` |  |
| probes.startupProbe.enabled | bool | `false` |  |
| rbac.enabled | bool | `false` |  |
| securityContext.allowPrivilegeEscalation | bool | `true` |  |
| securityContext.capabilities[0] | string | `"NET_RAW"` |  |
| securityContext.fsGroup | int | `0` |  |
| securityContext.fsGroupChangePolicy | string | `"Always"` |  |
| securityContext.privileged | bool | `true` |  |
| securityContext.readOnlyRootFilesystem | bool | `false` |  |
| securityContext.runAsGroup | int | `0` |  |
| securityContext.runAsNonRoot | bool | `false` |  |
| securityContext.runAsUser | int | `0` |  |
| service.ports[0].name | string | `"jellyfin"` |  |
| service.ports[0].port | int | `8096` |  |
| service.ports[0].protocol | string | `"TCP"` |  |
| service.ports[1].name | string | `"nginx"` |  |
| service.ports[1].port | int | `80` |  |
| service.ports[1].protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.name | string | `"nginx"` |  |
| storage.enabled | bool | `false` |  |

