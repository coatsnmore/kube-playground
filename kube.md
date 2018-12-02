# Setup

Prefer Docker for [Windows|Mac] if using latest Docker client.  Enable Kubernetes through Docker UI.

If that does not work, use minikube.

# Quick Start

## Without Config

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

## With Config

1. Deploy

```
kubectl create -f deployment.yaml
```

2. Start service and expose port

```
kubectl create -f service.yaml
```

## Deploy Dashboard

Refer to the [Dashboard Github repo](https://github.com/kubernetes/dashboard).

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
