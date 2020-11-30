FROM alpine:latest

EXPOSE 3000

RUN apk update
RUN apk add libc6-compat

ENV GRAFANA_VERSION=7.0.5

RUN addgroup grafana
RUN adduser -s /bin/false -G grafana -S -D grafana

RUN wget -c https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz
RUN tar -xzvf grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz
RUN mv grafana-${GRAFANA_VERSION} grafana
RUN rm grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz

RUN	mkdir -p /var/lib/grafana/dashboards /var/lib/grafana/data /var/lib/grafana/logs /var/lib/grafana/plugins
RUN	ln -s /grafana/plugins /var/lib/grafana/plugins
RUN	mv /grafana/bin/* /usr/bin/

COPY /srcs/defaults.ini /grafana/conf/defaults.ini

CMD ["grafana-server", "--homepath=/grafana"]
