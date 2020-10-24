eval $(minikube docker-env)
docker build -t phpmyadmin-alpine srcs/docker/phpmyadmin
kubectl apply -f srcs/yaml_files/phpmyadmin.yaml
