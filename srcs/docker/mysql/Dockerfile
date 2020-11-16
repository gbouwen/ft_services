FROM alpine

EXPOSE 3306

RUN apk update && apk add mysql mysql-client

RUN mkdir -p /run/mysqld

ENV MYSQL_ROOT_PASSWORD="root" \
	MYSQL_DATABASE="wordpress" \
	MYSQL_USER="admin" \
	MYSQL_PASSWORD="admin"

VOLUME	/var/lib/mysql

COPY	setup.sh /tmp
RUN		chmod +x /tmp/setup.sh

CMD		["/bin/sh", "/tmp/setup.sh"]
