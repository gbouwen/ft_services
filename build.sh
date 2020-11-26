eval $(minikube docker-env)
docker build -t grafana srcs/grafana

kubectl create configmap grafana-config \
		--from-file=srcs/grafana/influxdb-datasource.yaml \
		--from-file=srcs/grafana/grafana-dashboard-provider.yaml \
		--from-file=srcs/grafana/json_files/nginx-dashboard.json \
		--from-file=srcs/grafana/json_files/mysql-dashboard.json \
		--from-file=srcs/grafana/json_files/phpmyadmin-dashboard.json \
		--from-file=srcs/grafana/json_files/wordpress-dashboard.json \
		--from-file=srcs/grafana/json_files/influxdb-dashboard.json \
		--from-file=srcs/grafana/json_files/telegraf-dashboard.json \
		--from-file=srcs/grafana/json_files/grafana-dashboard.json

kubectl create -f srcs/grafana/grafana.yaml
