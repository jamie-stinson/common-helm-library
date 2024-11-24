<div align="center">

# Jamie's Common Helm Library

*A collection of Helm templates to simplify application deployment.*

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

## Getting Started  

All valid configuration options can be found in the [`values.yaml`](https://raw.githubusercontent.com/jamie-stinson/common-helm-library/main/values.yaml) file in the root directory of this project. By default, everything is disabled, but you can override these defaults by creating additional `values.yaml` files.  

### Installation  

Here’s a simple example of how to use this chart:  

1. Enable features and customize your workload in a `values.yaml` file.  

```yaml
workload:
  enabled: true
  type: DaemonSet
  image:
    registry: docker.io
    repository: nginx
    tag: latest
```
2. Install using the latest version of the common-helm-library

```helm install my-release oci://ghcr.io/jamie-stinson/common-helm-library/common-helm-library -f values.yaml```

### Recommendations
It’s highly recommended to use tools like ArgoCD or Flux to automate rollouts for this library and your values files. However, setting up these tools is outside the scope of this project.

