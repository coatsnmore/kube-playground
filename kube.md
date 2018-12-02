# Setup

**Prerequisite: Docker for [Windows|Mac]**

Recommended Prereq: [Homebrew Package Manager for OSX](https://brew.sh/) or [Chocolatey Package Manager for Windows](https://chocolatey.org/)

## Enable Kubernets

Prefer Docker for [Windows|Mac] if using latest Docker client.  Enable Kubernetes through Docker UI.

If that does not work, use minikube.

## Install `kubectl`

[Kubernetes Controller Installation Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### TLDR;

`brew install kubernetes-cli`

or 

`choco install kubernetes-cli`

# Quick Start

## Without Config (Option 1)

1. Deploy

```
kubectl run hello-node --image=coatsn/angular-server --port=3000 --image-pull-policy=IfNotPresent
```

2. Start as service and expose port

```
kubectl expose deployment hello-node --type=NodePort
```

3. Find the generated URL

```
kubectl describe services hello-node
``` 
and get the NodePort.

or alternatively if you are using minikube

```
minikube service hello-node --url
```

4. Test

```
curl http://<IP>:<NodePort>/books
```

## With Config (Option 2 -- Preferred)

1. Deploy and Expose as a Service

```
kubectl create -f app.yaml
```

# Deploy the [Kubernetes Dashboard](https://github.com/kubernetes/dashboard)

1. Start Dashboard.

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

2. Open secure tunnel to cluster.

```
kubectl proxy
```

3. Open Web UI Dashboard

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/persistentvolume?namespace=default

# Install [Helm](https://helm.sh/)

## Install Helm Client

with package managers...

`brew install kubernetes-helm`

`choco install kubernetes-helm -y`

or if you don't have `brew` or `choco` installed, follow the [instructions to install Helm without a package manager](https://docs.helm.sh/using_helm/#installing-helm).

## Initialize Helm and Install Tiller

The easiest way to install tiller into the cluster is simply to run `helm init`. This will validate that helm’s local environment is set up correctly (and set it up if necessary). Then it will connect to whatever cluster kubectl connects to by default (`kubectl config view`). Once it connects, it will install tiller into the kube-system namespace.

After helm init, you should be able to run `kubectl get pods --namespace kube-system` and see Tiller running.

## **TODO** Install Something with Helm

# Config Help

`kubectl explain service --recursive`

# References

* [API and Config Reference](https://v1-10.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/)
* [Kubernetes Examples](https://github.com/kubernetes/examples)
* [Networking Under the Hood](https://www.digitalocean.com/community/tutorials/kubernetes-networking-under-the-hood)
* [Networking Glossary](https://www.digitalocean.com/community/tutorials/an-introduction-to-networking-terminology-interfaces-and-protocols)
* [IP Addresses, Subnets, and CIDR Notation for Networking](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking)

