FROM alpine:latest

EXPOSE 3000

RUN apk update

ENV GRAFANA_VERSION=7.0.5

RUN wget -c https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz

CMD ["sleep", "5000"]
