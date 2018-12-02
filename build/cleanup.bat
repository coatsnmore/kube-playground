SET APP_NAME=webapp

REM cleanup any previous kube stuff
kubectl delete -f ..\app.yaml
