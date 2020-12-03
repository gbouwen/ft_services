#!/bin/bash

etc/init.d/sshd restart &

nginx -g 'daemon off;'
