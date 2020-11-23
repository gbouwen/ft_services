#!/bin/bash

touch tmp/init_mysql

chmod +x tmp/init_mysql

echo "CREATE DATABASE $MYSQL_DATABASE;" >> tmp/init_mysql
echo "CREATE USER '$MYSQL_USER' identified by '$MYSQL_PASSWORD';" >> tmp/init_mysql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER';" >> tmp/init_mysql
echo "FLUSH PRIVILEGES;" >> tmp/init_mysql
