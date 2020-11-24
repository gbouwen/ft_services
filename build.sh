eval $(minikube docker-env)
docker build -t wordpress srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.yaml
docker build -t mysql srcs/mysql
kubectl create -f srcs/mysql/mysql.yaml
