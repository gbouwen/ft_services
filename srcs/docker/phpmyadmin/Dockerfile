FROM alpine

EXPOSE 5000

# PHPMyAdmin

RUN	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip \
			php7-iconv php7-common php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
			php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-openssl

RUN mkdir -p /usr/share/webapps/
RUN cd /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN mv phpmyadmin /www
RUN chmod -R 777 /usr/share/webapps/

COPY config.inc.php /www
COPY php.ini /etc/php7/php.ini

# Nginx

RUN apk update && apk add nginx

RUN apk add openrc --no-cache

RUN adduser -D -g 'www' www

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf

RUN nginx -t

COPY setup.sh /tmp
RUN chmod +x /tmp/setup.sh

CMD ["sh", "/tmp/setup.sh"]
