<div align="center">

# Jamie's Common Helm Library

*A collection of Helm templates to simplify application deployment.*

***Disclaimer*** - This library is still under active development and breaking changes may occur at any time until v2 release (aim is Q2 2025)

</div>

<div align="center">
  <a href="https://github.com/jamie-stinson/common-helm-library/stargazers"><img src="https://img.shields.io/github/stars/jamie-stinson/common-helm-library?style=for-the-badge" alt="Stars Badge"/></a>
  <a href="https://github.com/jamie-stinson/common-helm-library/pulls"><img src="https://img.shields.io/github/issues-pr/jamie-stinson/common-helm-library?style=for-the-badge" alt="Pull Requests Badge"/></a>
  <a href="https://github.com/jamie-stinson/common-helm-library/issues"><img src="https://img.shields.io/github/issues/jamie-stinson/common-helm-library?style=for-the-badge" alt="Issues Badge"/></a>
  <a href="https://github.com/jamie-stinson/common-helm-library/graphs/contributors"><img src="https://img.shields.io/github/contributors/jamie-stinson/common-helm-library?style=for-the-badge" alt="Contributors Badge"/></a>
  <a href="https://github.com/jamie-stinson/common-helm-library/blob/master/LICENSE"><img src="https://img.shields.io/github/license/jamie-stinson/common-helm-library?style=for-the-badge" alt="License Badge"/></a>
</div>  


## Overview

Helm is the go-to tool for installing applications in Kubernetes. However, dealing with numerous charts from different sources often results in challenges, including:  

- Inconsistent versioning standards  
- Template duplication  
- Unclear or conflicting values  
- Missing features  
- Poor security practices  

To address these issues, I created a **comprehensive Helm library** that simplifies chart development while maintaining best practices. This library provides:  

- **Semantic Versioning:** Ensures meaningful and consistent updates.  
- **Common Templates:** Eliminates repetitive code for easier maintenance.  
- **Standardized Values:** Promotes clarity and uniformity.  
- **Extensive Features:** Covers a wide range of Kubernetes functionalities.  
- **Enhanced Security:** Incorporates best security practices.  

This library is designed to streamline Helm chart creation, providing a solid, secure foundation for developers.

This is a community chart, contributions are more than welcome to add, fix or extend functionlity!

## Getting Started  

All valid configuration options can be found in the [`values.yaml`](https://raw.githubusercontent.com/jamie-stinson/common-helm-library/main/values.yaml) file in the root directory of this project. By default, everything is disabled, but you can override these defaults by creating additional `values.yaml` files.  

### Basic Installation  

An easy way to get started using this library is by creating a simple `values.yaml` file and adding your required values following the library values schema.

`values.yaml`
```yaml
workload:
  enabled: true
  type: DaemonSet
  image:
    registry: docker.io
    repository: nginx
    tag: latest
```
You can then install using the latest version of the common-helm-library with the values you just created

```helm install my-release oci://ghcr.io/jamie-stinson/common-helm-library/common-helm-library -f values.yaml```

### Chart Dependency Installation

You can use this library as a dependancy for your own helm chart, this will allow you build, package and upload your own chart whilst still having the benefits of this library. 

***Chart.yaml***
```yaml
apiVersion: v2
name: example-application
description: A chart for deploying a cool example application
version: 1.0.0
dependencies:
  - name: common-helm-library
    repository: "oci://ghcr.io/jamie-stinson/common-helm-library"
    version: "1.0.0" # Replace with the appropriate version of the library
```

***values.yaml***
```yaml
common-helm-library:
  workload:
    enabled: true
    type: DaemonSet
    image:
      registry: docker.io
      repository: nginx
      tag: latest
```

### Advanced Installation (GitOps)

One of the best ways to use this library is using a tool such as ArgoCD or Flux utilising gitops methods to rollout applications.

This example (my personal repository) utilises ArgoCD and a seperate monorepo for applications, utilising common values files, semantic version auto patching and automatic rollouts.

This is just one of several ways you can utilise this library with tools such as ArgoCD and Flux and I would recommend reading the documentation for these tools so you can use them with the library in a way that suits your environment.

[`monorepo`](https://github.com/jamie-stinson/helm-system-monorepo)

***applicationset.yaml***
```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: system
  namespace: argocd
spec:
  generators:
  - git:
      files:
      - path: charts/*/values.yaml
      repoURL: https://github.com/jamie-stinson/helm-system-monorepo.git
      revision: HEAD
  goTemplate: true
  template:
    metadata:
      name: '{{ index .path.segments 1 }}'
    spec:
      destination:
        name: in-cluster
        namespace: '{{ if .namespace }}{{ .namespace }}{{ else }}{{ index .path.segments
          1 }}{{ end }}'
      project: production
      revisionHistoryLimit: 3
      syncPolicy:
        automated:
          allowEmpty: true
          prune: true
          selfHeal: true
        retry:
          backoff:
            duration: 5s
            factor: 2
            maxDuration: 3m
          limit: 3
        syncOptions:
        - Validate=true
        - CreateNamespace=true
        - PrunePropagationPolicy=foreground
        - PruneLast=true
        - ServerSideApply=true
        - RespectIgnoreDifferences=false
        - ApplyOutOfSyncOnly=false
  templatePatch: |
    spec:
      sources:
        - repoURL: "ghcr.io/jamie-stinson/common-helm-library"
          chart: "common-helm-library"
          targetRevision: "1.*.*"
          helm:
            releaseName: "{{ index .path.segments 1 }}"
            valueFiles:
              - "$values/global-values.yaml"
              - "$values/charts/{{ index .path.segments 1 }}/values.yaml"
        - repoURL: https://github.com/jamie-stinson/helm-system-monorepo.git
          targetRevision: HEAD
          ref: values
```

### Testing

tbc

## Supported Kubernetes Resources

The following table lists the Kubernetes resources and their current support status.

| Kubernetes Resource     | Supported     | Notes                          |
|-------------------------|---------------|--------------------------------|
| Deployment              | ✅             |  
| StatefulSet             | ✅             |
| DaemonSet               | ✅             |
| Job                     | ⏳             |
| CronJob                 | ⏳             |
| PodDisruptionBudget     | ✅             |
| HorizontalPodAutoscaler | ✅             |
| Service                 | ✅             |
| ConfigMap               | ✅             |
| Secret                  | ❗             |
| Ingress                 | ✅             |
| IngressClass            | ✅             |
| PersistentVolume        | ✅             |
| PersistentVolumeClaim   | ✅             |
| ServiceAccount          | ✅             |
| Role                    | ✅             |
| RoleBinding             | ✅             |
| ClusterRole             | ✅             |
| ClusterRoleBinding      | ✅             |
| StorageClass            | ✅             |

| Extension Resource      | Supported     | Requirements             | Notes              |
|-------------------------|---------------|--------------------------|--------------------|
| ServiceMonitor          | ✅             | Prometheus               |       
| Certificate             | ❗             | Cert Manager & Reloader  | Limited Functionality
| ClusterIssuer           | ❗             | Cert Manager & Reloader  | Limited Functionality
| Cluster                 | ❗             | CloudNative-PG           | Limited Functionality
| GrafanaDashboard        | ❗             | Grafana-Operator         | Limited Functionality
| GrafanaDatasource       | ❗             | Grafana-Operator         | Limited Functionality

> - ✅: Supported  
> - ❗: Partial support (limited functionality or features)
> - ❌: Not Planned  
> - ⏳: Planned for future updates
