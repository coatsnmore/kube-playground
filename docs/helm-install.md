# Install [Helm](https://helm.sh/)

## Install Helm Client

with package managers...

`brew install kubernetes-helm`

`choco install kubernetes-helm -y`

or if you don't have `brew` or `choco` installed, follow the [instructions to install Helm without a package manager](https://docs.helm.sh/using_helm/#installing-helm).

## Initialize Helm and Install Tiller

The easiest way to install tiller into the cluster is simply to run `helm init`. This will validate that helm’s local environment is set up correctly (and set it up if necessary). Then it will connect to whatever cluster kubectl connects to by default (`kubectl config view`). Once it connects, it will install tiller into the kube-system namespace.

After helm init, you should be able to run `kubectl get pods --namespace kube-system` and see Tiller running.
