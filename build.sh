eval $(minikube docker-env)
docker build -t wordpress srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.yaml
