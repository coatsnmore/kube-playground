# Local Build and Deploy

## Build Containers
```bash
.\build\build.bat
```

.. this will build an Angular app and a Node server exposing a REST API.

## Step by Step Deploy for node server

```bash
# deploy
kubectl run hello-node --image=coatsn/angular-server --port=3000 --image-pull-policy=IfNotPresent

# start as service and expose port
kubectl expose deployment hello-node --type=NodePort

# find the generated URL
kubectl describe services hello-node

# get the NodePort or alternatively if you are using minikube
minikube service hello-node --url

# test
curl http://<IP>:<NodePort>/books
```

## Quickstart Deploy server and webapp

```bash
# deploy and expose as a service
kubectl apply -f angular-app/app.yaml
```
