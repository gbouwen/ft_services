FROM alpine:latest

EXPOSE 5050

# Wordpress

RUN apk update

RUN apk add php7 php7-common php7-fpm php7-opcache php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli \
			php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-cli \
			php7-gettext php7-ldap php7-ctype php7-dom php7-openssl php7-zip php7-zlib php7-mbstring php7-session  \
			php-phar php-cli php7-bz2

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P tmp
RUN	chmod 755 tmp/wp-cli.phar
RUN	mv /tmp/wp-cli.phar /usr/local/bin/wp
RUN	wp cli update

WORKDIR /var/www/wordpress
RUN wp core download --allow-root
COPY /srcs/wp-config.php /var/www/wordpress/wp-config.php

WORKDIR /

COPY /srcs/install-wp.sh /tmp
RUN chmod +x /tmp/install-wp.sh

# NginX

RUN apk update
RUN apk add nginx

RUN adduser -D -g 'www' www

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /var/www/wordpress

RUN mkdir -p /run/nginx

COPY /srcs/nginx.conf /etc/nginx

RUN nginx -t

COPY srcs/wp_setup.sh /tmp
RUN chmod +x /tmp/wp_setup.sh

CMD ["/bin/sh", "/tmp/wp_setup.sh"]
