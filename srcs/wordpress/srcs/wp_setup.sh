#!/bin/bash

while ! mysqladmin ping -h mysql --silent;
do
	sleep 1
done

sh tmp/install-wp.sh

php-fpm7
nginx -g "daemon off;"
