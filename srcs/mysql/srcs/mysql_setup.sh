#!/bin/bash

mysql_install_db --datadir=/var/lib/mysql --user=mysql
mysqld_safe --datadir=/var/lib/mysql
