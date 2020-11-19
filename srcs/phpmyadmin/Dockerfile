FROM alpine:latest

EXPOSE 5000

# PhpMyAdmin

RUN apk update
RUN apk add php7 php7-common php7-fpm php7-opcache php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli \
			php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
			php7-gettext php7-ldap php7-ctype php7-dom php7-openssl php7-zip php7-zlib php7-mbstring php7-session

RUN mkdir -p /usr/share/webapps
RUN cd /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN mv phpmyadmin /www
RUN chmod -R 777 /usr/share/webapps

COPY srcs/config.inc.php /www

# NGinX

RUN apk update
RUN apk add nginx

RUN adduser -D -g 'www' www

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx

COPY /srcs/nginx.conf /etc/nginx

RUN nginx -t

COPY srcs/pma_setup.sh /tmp
RUN chmod +x /tmp/pma_setup.sh

CMD ["/bin/sh", "/tmp/pma_setup.sh"]
