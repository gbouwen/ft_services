eval $(minikube docker-env)

docker build -t nginx srcs/nginx

kubectl create -f srcs/nginx/nginx.yaml
