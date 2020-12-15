#!/bin/bash

etc/init.d/sshd start &

nginx

while true;
do
	sleep 5
	ps -ef | grep sshd | grep startups
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
