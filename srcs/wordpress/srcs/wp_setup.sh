#!/bin/bash

sh tmp/install-wp.sh

php-fpm7
nginx -g "daemon off;"
