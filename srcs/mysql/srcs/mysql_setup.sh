#!/bin/bash

mysql_install_db --datadir=/var/lib/mysql --user=mysql
tail -f /dev/null
