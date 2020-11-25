eval $(minikube docker-env)
docker build -t mysql srcs/mysql
kubectl create -f srcs/mysql/mysql.yaml
