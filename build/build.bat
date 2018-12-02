SET TAG=1.0
SET PORT=30080
SET USER=coatsn
SET CACHE_DATE=%date:~10,4%

REM cleanup any previous kube stuff
kubectl delete -f ..\app.yaml

REM build server
cd ../server
docker build --build-arg CACHE_DATE=%CACHE_DATE% -t %USER%/node-server:%TAG% .

REM build angular web app
cd ..
docker build --build-arg CACHE_DATE=%CACHE_DATE% -t %USER%/angular-web:%TAG% .

REM deploy
kubectl create -f app.yaml

REM test
curl.exe http://localhost:30080/books

ECHO if got empty reply try `curl.exe http://localhost:30080/books` again..
