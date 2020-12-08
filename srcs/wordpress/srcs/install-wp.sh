#!/bin/bash

wp core install --path=/var/www/wordpress --url=http://192.168.99.200:5050 --title=ft_services \
				--admin_user=admin --admin_password=admin --admin_email=gijsbouwen@gmail.com --skip-email --allow-root

wp user create --path=/var/www/wordpress user1 user1@gmail.com --user_pass=user1 --role=author --allow-root
wp user create --path=/var/www/wordpress user2 user2@gmail.com --user_pass=user2 --role=subscriber --allow-root
wp user create --path=/var/www/wordpress user3 user3@gmail.com --user_pass=user3 --role=contributor --allow-root
