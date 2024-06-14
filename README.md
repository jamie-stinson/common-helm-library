<h1 align="center">Jamie's Common Helm Library</h1>
<p align="center"><i>A collection of helm templates to make creating applications easy. </i></p>
<div align="center">
<a href="[https://github.com/jamie-stinson/common-helm-library/stargazers](https://github.com/jamie-stinson/common-helm-library/stargazers)"><img src="https://img.shields.io/github/stars/jamie-stinson/common-helm-library?style=for-the-badge" alt="Stars Badge"/></a>
<a href="https://github.com/jamie-stinson/common-helm-library/pulls"><img src="https://img.shields.io/github/issues-pr/jamie-stinson/common-helm-library?style=for-the-badge" alt="Pull Requests Badge"/></a>
<a href="https://github.com/jamie-stinson/common-helm-library/issues"><img src="https://img.shields.io/github/issues/jamie-stinson/common-helm-library?style=for-the-badge" alt="Issues Badge"/></a>
<a href="https://github.com/jamie-stinson/common-helm-library/graphs/contributors"><img alt="GitHub contributors" src="https://img.shields.io/github/contributors/jamie-stinson/common-helm-library?style=for-the-badge"></a>
<a href="https://github.com/jamie-stinson/common-helm-library/blob/master/LICENSE"><img src="https://img.shields.io/github/license/jamie-stinson/common-helm-library?style=for-the-badge" alt="License Badge"/></a>
</div>

<br>
During the setup of my homelab, I encountered numerous challenges using a variety of external Helm charts. Having so many charts from different sources led to several annoyances such as different versioning standards, monolithic charts, template duplication, inconsistent values, missing features, and poor security practices.

<br>
To address these issues, I developed a comprehensive library that enables users to create Helm charts with the following benefits:

<br>

* `Semantic Versioning`: Ensuring consistent and meaningful version updates.
* `Minimal Design`: Following microservice artitecture, no monolithic charts
* `Common Templates`: Eliminating repeated code for easier maintenance.
* `Standardized & Clear Values`: Providing clarity and uniformity.
* `Extensive Features`: Incorporating a wide range of Kubernetes functionalities into the template specification.
* `Enhanced Security Measures`: Implementing stringent security protocols.

<br>

This library is designed to streamline the creation and maintenance of Helm charts, offering a standardized and secure foundation. Users can easily build and maintain their own charts by following the provided getting started guide, or they can utilize our existing prebuilt Helm charts, all of which leverage this common library.

## Getting Started

### Setup repository

Either create a new repository or using an existing one add the following file structure.

    .
    ├── ...
    ├── charts                  # Chart directories
    │   ├── example             # Application name
    │   │   ├── templates       # Template files
    │   │   │   └── common.yaml # Common loader
    │   │   ├── Chart.yaml      # Chart information
    │   │   ├── values.yaml     # Chart values
    │   │   └── ...
    │   └── ...                 # etc.
    └── ...

### Adding Chart Information

Charts require a file which includes information about the chart, we recommend using the following fields in your `Chart.yaml`:

```yaml
apiVersion: v2
description: An example Helm chart # Description of what the chart is
name: example-chart                # Name of the chart
version: 1.2.3                     # Version of this chart
appVersion: 10.9.3                 # Version of the application (this will be used as the image tag)
```

* Please edit example values accordingly

### Adding Dependency

To use the library chart, `common-helm-library` should be listed in `dependencies` field in your `Chart.yaml`:

```yaml
dependencies:
  - name: common-helm-library
    version: ~1.0.0
    repository: https://jamie-stinson.github.io/common-helm-library/
    import-values:
      - child: defaults
        parent: .
```

* It is recommended to use `~` in the version this will match a version and any patches in the release instead of pinning a version.
* The version used above is not the latest stable, check the releases for that.

### Adding Values

You can begin to configure your chart by overriding our default [values](https://raw.githubusercontent.com/jamie-stinson/common-helm-library/main/charts/common/values.yaml) in your `values.yaml` file as you see fit. Worth noting not to include the `default` field.

```yaml
type: DaemonSet
image:
  registry: docker.io
  repository: nginx
  tag: latest
```

* This is just an example please customize as you see fit

### Adding Common Loader

The common helm library has a function to load in all templates, you must put this field in your `common.yaml`:

```yaml
{{- include "common-helm-library.loader.all" . }}
```

### Installing Charts

We **strongly** recommend installing charts via a GitOps tool like [ArgoCD](https://github.com/argoproj/argo-cd). You can package up and install the charts manually however that is out of scope from this project. Below is an example ArgoCD ApplicationSet you can use to dynamically generate your helm charts. There are so many different ways you can customise and install helm charts, so definitely do your research and find what suits you the best.

```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: default
  namespace: argocd
spec:
  goTemplate: true
  goTemplateOptions:
  - missingkey=error
  generators:
  - git:
      files:
        - path: charts/*/values.yaml
      repoURL: REPO_ENDPOINT_HERE
      revision: HEAD
  template:
    metadata:
      name: '{{.path.basename}}'
    spec:
      project: "default"
      source:
        repoURL: REPO_ENDPOINT_HERE
        targetRevision: HEAD
        path: '{{.path.path}}'
      destination:
        server: https://kubernetes.default.svc
        namespace: '{{ .namespace }}'
      revisionHistoryLimit: 3
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
          allowEmpty: true 
        syncOptions:
        - Validate=true
        - CreateNamespace=true
        - PrunePropagationPolicy=foreground
        - PruneLast=true        
        - ServerSideApply=false
        - RespectIgnoreDifferences=false
        - ApplyOutOfSyncOnly=false
        retry:
          limit: 5
          backoff:
            duration: 5s
            factor: 2
            maxDuration: 3m
```

* Replace **REPO_ENDPOINT_HERE** with the git repository of your charts.
* This is just an example please customize as you see fit
