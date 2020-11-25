FROM alpine:latest

EXPOSE 8086

RUN apk update

RUN apk add influxdb

COPY /srcs/influxdb.conf /etc

RUN mkdir -p /var/lib/influxdb/meta
RUN mkdir -p /var/lib/influxdb/data
RUN mkdir -p /var/lib/influxdb/wal

VOLUME /var/lib/influxdb

CMD ["influxd -config /etc/influxdb.conf"]
