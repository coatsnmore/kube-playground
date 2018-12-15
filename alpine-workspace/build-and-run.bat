SET USER=coatsn
SET TAG=%USER%/alpine-workspace:1
SET USER_WORKSPACE=C:\devl\kube-playground

docker build -t %TAG% -f alpine-workspace.Dockerfile --build-arg USER=%USER% .
docker run --volume %USER_WORKSPACE%:/home/%USER%/src -it %TAG%

