FROM alpine

EXPOSE 3306

# Install MySQL
RUN apk update && apk add mysql mysql-client

RUN mkdir /run/mysqld

RUN mysql_install_db --user=root

ENV	MYSQL_ROOT_PASSWORD="root" \
	MYSQL_DATABASE="wordpress" \
	MYSQL_USER="admin" \
	MYSQL_PASSWORD="admin"

# Create volume
VOLUME /var/lib/mysql

CMD ["mysqld", "--user=root"]
