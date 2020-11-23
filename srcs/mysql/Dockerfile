FROM alpine:latest

EXPOSE 3306

RUN apk update
RUN apk add mysql mysql-client

ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=admin

RUN addgroup mysql mysql

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql

COPY /srcs/create_init_file.sh /tmp
RUN chmod +x /tmp/create_init_file.sh
RUN sh /tmp/create_init_file.sh

COPY /srcs/my.cnf /etc/mysql/my.cnf
COPY /srcs/mysql_setup.sh /tmp
RUN chmod +x /tmp/mysql_setup.sh

VOLUME /var/lib/mysql

RUN chmod -R 755 /var/lib/mysql/

CMD ["/bin/sh", "/tmp/mysql_setup.sh"]
