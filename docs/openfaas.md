
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
