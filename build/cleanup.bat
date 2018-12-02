SET APP_NAME=webapp

REM cleanup any previous kube stuff
kubectl delete deployment %APP_NAME%
kubectl delete service %APP_NAME%-svc
