<h1 align="center">Jamie's Common Helm Library</h1>
<p align="center"><i>A collection of helm templates to make creating applications easy. </i></p>
<div align="center">
<a href="[https://github.com/elangosundar/awesome-README-templates/stargazers](https://github.com/jamie-stinson/common-helm-library/stargazers)"><img src="https://img.shields.io/github/stars/jamie-stinson/common-helm-library?style=for-the-badge" alt="Stars Badge"/></a>
<a href="https://github.com/elangosundar/awesome-README-templates/pulls"><img src="https://img.shields.io/github/issues-pr/jamie-stinson/common-helm-library?style=for-the-badge" alt="Pull Requests Badge"/></a>
<a href="https://github.com/elangosundar/awesome-README-templates/issues"><img src="https://img.shields.io/github/issues/jamie-stinson/common-helm-library?style=for-the-badge" alt="Issues Badge"/></a>
<a href="https://github.com/elangosundar/awesome-README-templates/graphs/contributors"><img alt="GitHub contributors" src="https://img.shields.io/github/contributors/jamie-stinson/common-helm-library?style=for-the-badge"></a>
<a href="https://github.com/elangosundar/awesome-README-templates/blob/master/LICENSE"><img src="https://img.shields.io/github/license/jamie-stinson/common-helm-library?style=for-the-badge" alt="License Badge"/></a>
</div>
<br>
During the setup of my homelab, I encountered numerous challenges with existing Helm charts. These charts frequently exhibited inconsistent values files, lacked essential features, had inadequate security, were devoid of testing, and suffered from inconsistent versioning. Additionally, the redundancy of code across various charts made tracking changes and implementing edits cumbersome.
<br>
<br>

To address these issues, I developed a comprehensive library that enables users to create Helm charts with the following benefits:
<br>

* `Semantic versioning`: Ensuring consistent and meaningful version updates.
* `No template redundancy`: Eliminating repeated code for easier maintenance.
* `Consistent and readable values files`: Providing clarity and uniformity.
* `Extensive Kubernetes features`: Incorporating a wide range of Kubernetes functionalities into the template specification.
* `Enhanced security measures`: Implementing stringent security protocols.
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
