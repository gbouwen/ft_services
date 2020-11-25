#!/bin/bash

until mysql
do
	echo '.'
	sleep 1
done

mysql wordpress < wordpress.sql
