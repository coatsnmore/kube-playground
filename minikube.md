# setup

- installed virtualbox
- upraded brew.
- installed kubectl with homebrew
- insatlled minikube via homebrew via `brew cask install minikube`
- started minibuke via `minikube start`

# setup local images for use by minikube

`eval $(minikube docker-env)`

and then build the image...https://stackoverflow.com/a/40602408

`docker build -t coatsn/angular-server .`

# start the thing

`kubectl run hello-node --image=coatsn/angular-server --port=3000 --image-pull-policy=IfNotPresent`

# expose port

`kubectl expose deployment hello-node --type=NodePort`

# find url

`kubectl describe services hello-node` and get NodePort

or `minikube service hello-node --url`

# deploy using config

`kubectl create -f deployment.yaml`

and then...

`kubectl create -f service.yaml`

