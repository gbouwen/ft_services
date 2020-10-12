# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: gbouwen <marvin@codam.nl>                    +#+                      #
#                                                    +#+                       #
#    Created: 2020/07/13 08:39:18 by gbouwen       #+#    #+#                  #
#    Updated: 2020/10/12 14:40:19 by gbouwen       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# Set environment
eval $(minikube docker-env)

# Build Dockerfiles
# docker build -t nginx-alpine srcs/docker/nginx/Dockerfile
# docker build -t mysql-alpine srcs/docker/mysql/Dockerfile
# docker build -t phpmyadmin-alpine srcs/docker/phpmyadmin/Dockerfile
# docker build -t wordpress-alpine srcs/docker/wordpress/Dockerfile
# docker build -t influxdb-alpine srcs/docker/influxdb/Dockerfile
# docker build -t grafana-alpine srcs/docker/grafana/Dockerfile
# docker build -t influxdb-alpine srcs/docker/influxdb/Dockerfile
# docker build -t ftps-alpine srcs/docker/ftps/Dockerfile

# in yaml file: imagePullPolicy: never

# Start minikube
minikube start --driver=virtualbox

# Create secrets
kubectl create -f srcs/yaml_files/secrets.yaml
kubectl create -f srcs/yaml_files/mysql-password.yaml

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
