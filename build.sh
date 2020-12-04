eval $(minikube docker-env)

docker build -t nginx srcs/nginx

kubectl create -f srcs/nginx/nginx.yaml

docker build -t phpmyadmin srcs/phpmyadmin

kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml
