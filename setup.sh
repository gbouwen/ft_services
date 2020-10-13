# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: gbouwen <marvin@codam.nl>                    +#+                      #
#                                                    +#+                       #
#    Created: 2020/07/13 08:39:18 by gbouwen       #+#    #+#                  #
#    Updated: 2020/10/13 15:50:21 by gbouwen       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# Start minikube
minikube start --driver=virtualbox

# Set environment
eval $(minikube docker-env)

# Build Dockerfiles

# Build nginx
docker build -t nginx-alpine srcs/docker/nginx/
docker build -t mysql-alpine srcs/docker/mysql/
# docker build -t phpmyadmin-alpine srcs/docker/phpmyadmin/
# docker build -t wordpress-alpine srcs/docker/wordpress/
# docker build -t influxdb-alpine srcs/docker/influxdb/
# docker build -t grafana-alpine srcs/docker/grafana/
# docker build -t influxdb-alpine srcs/docker/influxdb/
# docker build -t ftps-alpine srcs/docker/ftps/

# Create secrets
kubectl create -f srcs/yaml_files/secrets.yaml

# Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Configure MetalLB
kubectl create -f srcs/yaml_files/metallb.yaml

# Configure Nginx
kubectl create -f srcs/yaml_files/nginx.yaml

# Configure MySQL
kubectl create -f srcs/yaml_files/mysql.yaml

# Configure PhpMyAdmin
kubectl create -f srcs/yaml_files/phpmyadmin.yaml

# Configure Wordpress
kubectl create -f srcs/yaml_files/wordpress.yaml

# Configure Grafana
kubectl create -f srcs/yaml_files/grafana.yaml

# Configure InfluxDB
kubectl create -f srcs/yaml_files/influxdb.yaml

# Configure Telegraf
kubectl create -f srcs/yaml_files/telegraf-configmap.yaml
kubectl create -f srcs/yaml_files/telegraf.yaml

# Configure FTPS
# kubectl create -f srcs/yaml_files/ftps.yaml
