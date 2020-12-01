eval $(minikube docker-env)
docker build -t ftps srcs/ftps

kubectl create -f srcs/ftps/ftps.yaml
