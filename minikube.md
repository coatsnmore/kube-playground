**If on Windows and using  Docker for Windows 18.02 CE Edge and higher, and 18.06 Stable and higher .... then can use built-in Kubernetes cluster**

# osx setup

- install docker
- installed virtualbox
- upraded brew.
- installed kubectl with homebrew
- installed minikube via homebrew via `brew cask install minikube`
- started minibuke via `minikube start`

# windows setup (unfinished b/c found easier method for kube using Docker for Windows)

- install docker
- enable Hyper-V by running Powershell command (in powershell as admin): `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`
- install kubectl with chocolatey package manager (in admin shell): `choco install kubernetes-cli`
- download minikube binary at https://github.com/kubernetes/minikube/releases and add to `%PATH%`
- modify hyper v settings (https://medium.com/@JockDaRock/minikube-on-windows-10-with-hyper-v-6ef0f4dc158c)
- 

# setup local images for use by minikube

`eval $(minikube docker-env)`

and then build the image...https://stackoverflow.com/a/40602408

`docker build -t coatsn/angular-server .`

