eval $(minikube docker-env)
docker build -t mysql srcs/docker/mysql
kubectl apply -f srcs/yaml_files/mysql.yaml
