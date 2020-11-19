eval $(minikube docker-env)
docker build -t phpmyadmin srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml
