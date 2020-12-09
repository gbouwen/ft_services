#!/bin/bash

while ! mysqladmin ping -h mysql --silent;
do
	sleep 1
done

sh tmp/install-wp.sh

php-fpm7
nginx -g "daemon off;"

while true;
do
	ps -ef | grep php-fpm | grep master
	if [ $? == 1 ]
	then
		break
	fi
	ps -ef | grep nginx | grep master
	if [ $? == 1 ]
	then
		break
	fi
done
