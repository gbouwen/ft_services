#!/bin/bash

adduser -S admin
echo "admin:admin" | chpasswd
chown -R admin /home/admin

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
