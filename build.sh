eval $(minikube docker-env)
docker build -t mysql srcs/mysql
kubectl create -f srcs/mysql/mysql.yaml
docker build -t phpmyadmin srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml
