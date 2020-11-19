FROM alpine:latest

EXPOSE 3306

RUN apk update
RUN apk add mysql mysql-client

RUN chown mysql:mysql /var/lib/mysql

RUN mkdir -p /run/mysqld

COPY /srcs/my.cnf /etc/mysql/my.cnf
COPY /srcs/mysql_setup.sh /tmp
RUN chmod +x /tmp/mysql_setup.sh

VOLUME /var/lib/mysql

RUN chmod -R 755 /var/lib/mysql/

CMD ["/bin/sh", "/tmp/mysql_setup.sh"]
