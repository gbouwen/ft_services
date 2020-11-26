eval $(minikube docker-env)
docker build -t telegraf srcs/telegraf
kubectl create -f srcs/telegraf/telegraf.yaml
