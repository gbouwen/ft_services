# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: gbouwen <marvin@codam.nl>                    +#+                      #
#                                                    +#+                       #
#    Created: 2020/07/13 08:39:18 by gbouwen       #+#    #+#                  #
#    Updated: 2020/11/26 15:35:38 by gbouwen       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# Start minikube
minikube start --driver=virtualbox

# Set environment
eval $(minikube docker-env)

# Build Dockerfiles

docker build -t nginx srcs/nginx
docker build -t mysql srcs/mysql
docker build -t phpmyadmin srcs/phpmyadmin
docker build -t wordpress srcs/wordpress
docker build -t influxdb srcs/influxdb
docker build -t telegraf srcs/telegraf
docker build -t grafana srcs/grafana
# docker build -t ftps srcs/ftps

# Create secrets
kubectl create -f srcs/secrets.yaml

# Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Configure MetalLB
kubectl create -f srcs/metallb.yaml

# Configure Nginx
kubectl create -f srcs/nginx/nginx.yaml

# Configure MySQL
kubectl create -f srcs/mysql/mysql.yaml

# Configure PhpMyAdmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml

# Configure Wordpress
kubectl create -f srcs/wordpress/wordpress.yaml

# Configure Grafana
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

# Configure InfluxDB
kubectl create -f srcs/influxdb/influxdb.yaml

# Configure Telegraf
kubectl create -f srcs/telegraf/telegraf.yaml

# Configure FTPS
# kubectl create -f srcs/yaml_files/ftps.yaml
