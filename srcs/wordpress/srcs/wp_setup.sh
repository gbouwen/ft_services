#!/bin/bash

while ! mysqladmin ping -h mysql --silent;
do
	sleep 1
done

sh tmp/install-wp.sh

php-fpm7
nginx

while true;
do
	sleep 5
	ps -ef | grep php-fpm | grep master
	if [ $? == 1 ]
	then
		echo $?
		echo "stopping..."
		break
	fi
	ps -ef | grep nginx | grep master
	if [ $? == 1 ]
	then
		echo $?
		echo "stopping..."
		break
	fi
done
