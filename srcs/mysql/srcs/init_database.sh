#!/bin/bash

echo 'Waiting for mysql'
until mysql
do
	echo "."
	sleep 1
done

echo '\n'

mysql -u root wordpress < wordpress.sql
