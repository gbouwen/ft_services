#!/bin/bash

mysql_install_db --datadir=/var/lib/mysql --user=root
mysqld_safe --user=root
