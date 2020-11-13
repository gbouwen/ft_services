eval $(minikube docker-env)
docker build -t mysql-alpine srcs/docker/phpmyadmin
kubectl apply -f srcs/yaml_files/mysql.yaml
