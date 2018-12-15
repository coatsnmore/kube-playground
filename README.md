# Kubernetes Playground

![Kubernetes Logo](/images/kubernetes-ar21.svg)

Installation Guide to Facilitate Playground-like Activity.

# Contents

* (Optional) [Install Minikube](/docs/minikube.md)
* [Build and deploy a docker container locally](/docs/local.md)
* Enable local Kubernetes single-node cluster
* Install Kubernetes Controller `kubectl`
* Build and run an Angular web app and a Node server in separates pods using a service
* Install the Kubernetes Dashboard for managing your local cluster
* Install Helm, the Kubernetes package manager
* Install Helm's server, Tiller, into your local cluster.
* Install OpenFaaS using Helm

**TODO**
* Install and Demonstrate Envoy proxy
* Install and Manage Istio
* Create Helm chart
* Install Jenkins
* Install CircleCI

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

# Install [Helm](https://helm.sh/)

## Install Helm Client

with package managers...

`brew install kubernetes-helm`

`choco install kubernetes-helm -y`

or if you don't have `brew` or `choco` installed, follow the [instructions to install Helm without a package manager](https://docs.helm.sh/using_helm/#installing-helm).

## Initialize Helm and Install Tiller

The easiest way to install tiller into the cluster is simply to run `helm init`. This will validate that helm’s local environment is set up correctly (and set it up if necessary). Then it will connect to whatever cluster kubectl connects to by default (`kubectl config view`). Once it connects, it will install tiller into the kube-system namespace.

After helm init, you should be able to run `kubectl get pods --namespace kube-system` and see Tiller running.

## Install [OpenFaaS](https://docs.openfaas.com/) with Helm

1. Create RBAC Permissions for Tiller:

Linux:

```bash
kubectl -n kube-system create sa tiller \
 && kubectl create clusterrolebinding tiller \
      --clusterrole cluster-admin \
      --serviceaccount=kube-system:tiller
```
Windows:

```bat
kubectl -n kube-system create sa tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
```
2. Install the server-side Tiller component on your cluster

```bash
helm init --skip-refresh --upgrade --service-account tiller
```

3. Install OpenFaaS

**Create Namespace**
```bash
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
```

**Add the OpenFaaS helm chart:**
```bash
helm repo add openfaas https://openfaas.github.io/faas-netes/
```

**Generate Secrets to Apply Basic Auth for API Gateway**

Linux:
```bash
# generate a random password
PASSWORD=$(head -c 12 /dev/urandom | shasum| cut -d' ' -f1)
kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=admin --from-literal=basic-auth-password="$PASSWORD"
```

Windows:
```bash
kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=admin --from-literal=basic-auth-password="MAKEUP_A_PASSWORD"
```

**Deploy OpenFaaS from the helm chart repo**

Reference: https://github.com/openfaas/faas-netes/blob/master/chart/openfaas/README.md#install

```bash
helm repo update
helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set basic_auth=true --set functionNamespace=openfaas-fn
```

**Install [OpenFaaS CLI](https://github.com/openfaas/faas-cli)**

Windows: https://github.com/openfaas/faas-cli#windows
* Install the Executable in this directory.  Make sure it does not get committed into Github.

Linux: https://github.com/openfaas/faas-cli#get-started-install-the-cli

**Find Port**
```bash
kubectl get svc -n openfaas gateway-external -o wide
```

**Login**

```BAT
.\faas-cli.exe login -g http://localhost:31112 -u admin --password=PASSWORD
```

**Open the UI**

This is the same port used for logging in from the command line.

http://localhost:31112/ui/

# YAML Config + REST API Help

`kubectl explain service --recursive`

# References

* [API and Config Reference](https://v1-10.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/)
* [Kubernetes Examples](https://github.com/kubernetes/examples)
* [Networking Under the Hood](https://www.digitalocean.com/community/tutorials/kubernetes-networking-under-the-hood)
* [Networking Glossary](https://www.digitalocean.com/community/tutorials/an-introduction-to-networking-terminology-interfaces-and-protocols)
* [IP Addresses, Subnets, and CIDR Notation for Networking](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking)
* [Illustrated Guide to Kubernetes Networking](https://medium.com/@ApsOps/an-illustrated-guide-to-kubernetes-networking-part-1-d1ede3322727)
* [Complete Linux Networking Tutorial](https://www.youtube.com/watch?v=fHgk7aDGn_4)
