#!/bin/bash

/usr/bin/mysql_install_db --user=root
# /usr/bin/mysqld --user=root
cd '/usr' ; /usr/bin/mysqld_safe --datadir='./data'
