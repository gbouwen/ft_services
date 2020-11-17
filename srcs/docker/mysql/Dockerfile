FROM alpine

EXPOSE 3306

RUN apk update && apk add --no-cache mysql mysql-client
RUN rm -f /var/cache/apk/*

# RUN mkdir -p /run/mysqld

# RUN addgroup mysql mysql
COPY my.cnf /etc/

# ENV MYSQL_ROOT_PASSWORD=admin
# ENV MYSQL_DATABASE=wordpress
# ENV MYSQL_USER=admin
# ENV MYSQL_PASSWORD=admin

VOLUME	/var/lib/mysql

COPY	setup.sh /tmp
RUN		chmod +x /tmp/setup.sh

CMD		["/bin/sh", "/tmp/setup.sh"]
