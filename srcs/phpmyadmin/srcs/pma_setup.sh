#!/bin/bash

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
