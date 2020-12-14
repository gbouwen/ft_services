#!/bin/bash

php-fpm7
nginx

while true;
do
	sleep 5
	ps -ef | grep php-fpm | grep master
	if [ $? == 1 ]
	then
		echo "$?"
		echo "stopping..."
		break
	fi
	ps -ef | grep nginx | grep master
	if [ $? == 1 ]
	then
		echo "$?"
		echo "stopping..."
		break
	fi
done
