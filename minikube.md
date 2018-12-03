**If on Windows and using  Docker for Windows 18.02 CE Edge and higher, and 18.06 Stable and higher .... then can use built-in Kubernetes cluster**

# osx setup

Prerequsites:
- install docker through their website
- install virtualbox through their website
- install brew if you do not have it from their website

Now let's bring the command line:
- uprade brew
```bash
brew update
```
install minikube via homebrew
```bash
brew cask install minikube
```
start minikube
```bash
minikube start
```
setup local images for use by minikube
```bash
eval $(minikube docker-env)
```
build the image
```bash
docker build -t coatsn/angular-server .
```

# Windows Setup for Windows 10 Pro (unfinished b/c found easier method for kube using Docker for Windows)

- install docker through their website
- enable Hyper-V by running Powershell command (in powershell as admin): `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`
- download minikube binary at https://github.com/kubernetes/minikube/releases and add to `%PATH%`
- modify hyper v settings (https://medium.com/@JockDaRock/minikube-on-windows-10-with-hyper-v-6ef0f4dc158c)
