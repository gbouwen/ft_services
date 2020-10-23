FROM alpine

EXPOSE 5000

# PHPMyAdmin

RUN apk update && apk add php7 php7-bcmath php7-ctype php7-curl php7-fpm php7-gd php7-iconv php7-intl \
        php7-json php7-mbstring php7-mcrypt php7-mysqlnd php7-opcache php7-openssl php7-pdo php7-pdo_mysql \
		php7-pdo_pgsql php7-pdo_sqlite php7-phar php7-posix php7-session php7-soap php7-xml php7-zip

RUN mkdir -p /usr/share/webapps/
RUN cd /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN mv phpmyadmin /www
RUN chmod -R 777 /usr/share/webapps/

COPY config.inc.php /www

# Nginx

RUN apk update && apk add nginx

RUN apk add openrc --no-cache

RUN adduser -D -g 'www' www

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf

RUN nginx -t

CMD ["nginx", "-g", "daemon off;"]
