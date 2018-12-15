# Setup

**Prerequisite: Docker for [Windows|Mac]**

Recommended Prereq: [Homebrew Package Manager for OSX](https://brew.sh/) or [Chocolatey Package Manager for Windows](https://chocolatey.org/)

## Enable Kubernetes

Prefer Docker for [Windows|Mac] if using latest Docker client.  Enable Kubernetes through Docker UI.

If that does not work, use minikube.

## Install `kubectl`

[Kubernetes Controller Installation Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### TLDR;

`brew install kubernetes-cli`

or 

`choco install kubernetes-cli`

# Deploy the [Kubernetes Dashboard](https://github.com/kubernetes/dashboard)

```bash
# start dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

# open secure tunnel to cluster
kubectl proxy
```

Open Web UI Dashboard

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/persistentvolume?namespace=default
