# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: gbouwen <marvin@codam.nl>                    +#+                      #
#                                                    +#+                       #
#    Created: 2020/07/13 08:39:18 by gbouwen       #+#    #+#                  #
#    Updated: 2020/07/15 11:59:04 by gbouwen       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

minikube start --driver=virtualbox

# Create system secrets
kubectl create -f srcs/yaml_files/secrets.yaml

# MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl create -f srcs/yaml_files/metallb.yaml

# Nginx
kubectl create -f srcs/yaml_files/nginx.yaml

# MySQL
kubectl create -f srcs/yaml_files/mysql.yaml

# PhpMyAdmin
kubectl create -f srcs/yaml_files/phpmyadmin.yaml

# WordPress
kubectl create -f srcs/yaml_files/wordpress.yaml
