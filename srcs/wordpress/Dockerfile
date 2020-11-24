FROM alpine:latest

EXPOSE 5050

# Wordpress

RUN apk update
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
			php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN mkdir -p /www
RUN cd /www
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz

# NginX

RUN apk update
RUN apk add nginx

RUN adduser -D -g 'www' www

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx

COPY /srcs/nginx.conf /etc/nginx

RUN nginx -t

COPY srcs/wp_setup.sh /tmp
RUN chmod +x /tmp/wp_setup.sh

CMD ["/bin/sh", "/tmp/wp_setup.sh"]
