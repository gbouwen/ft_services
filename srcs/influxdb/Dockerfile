FROM alpine:latest

EXPOSE 8086

RUN apk update

RUN apk add influxdb

ENV INFLUXDB_DB=telegraf
ENV INFLUXDB_HOST=influxdb
ENV INFLUXDB_URL=http://influxdb:8086
ENV INFLUXDB_USER=admin
ENV INFLUXDB_USER_PASSWORD=admin

COPY /srcs/influxdb.conf /etc

RUN mkdir -p /var/lib/influxdb/meta
RUN mkdir -p /var/lib/influxdb/data
RUN mkdir -p /var/lib/influxdb/wal

VOLUME /var/lib/influxdb

CMD ["influxd", "-config", "/etc/influxdb.conf"]
