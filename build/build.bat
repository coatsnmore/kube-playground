
REM #################################
REM Run this from the base directory
REM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SET TAG=1.0
SET PORT=30080
SET USER=coatsn
SET CACHE_DATE=%date:~10,4%

REM cleanup any previous kube stuff
kubectl delete -f angular-app\app.yaml

REM build server
docker build --build-arg CACHE_DATE=%CACHE_DATE% -t %USER%/node-server:%TAG% -f node-server/Dockerfile .

REM build angular web app
docker build --build-arg CACHE_DATE=%CACHE_DATE% -t %USER%/angular-web:%TAG% -f angular-app/Dockerfile .

REM deploy
kubectl apply -f angular-app/app.yaml
