SET TAG=1.0
SET APP_NAME=webapp
SET PORT=30080
SET USER=coatsn

REM cleanup any previous kube stuff
kubectl delete deployment %APP_NAME%
kubectl delete service %APP_NAME%-svc

REM build server
cd ../server
docker build -t %USER%/node-server:%TAG% .

REM build angular web app
cd ..
docker build -t %USER%/angular-web:%TAG% .

REM deploy
kubectl create -f deployment.yaml

REM run as service and expose post
kubectl create -f service.yaml

REM test
curl.exe http://localhost:30080/books

ECHO if got empty reply try `curl.exe http://localhost:30080/books` again..
