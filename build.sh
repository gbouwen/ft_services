eval $(minikube docker-env)
docker build -t influxdb srcs/influxdb
kubectl create -f srcs/influxdb/influxdb.yaml
