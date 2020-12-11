FROM alpine:latest

EXPOSE 20 21 21000-21002

RUN apk add vsftpd

COPY /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY /srcs/cert.pem /etc/ssl/certs
COPY /srcs/key.pem /etc/ssl/private

COPY /srcs/setup.sh /tmp
RUN chmod +x /tmp/setup.sh

EXPOSE 20 21 21000-21002

CMD ["/bin/sh", "/tmp/setup.sh"]
