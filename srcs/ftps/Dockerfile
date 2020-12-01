FROM alpine:latest

EXPOSE 21 21000-21010

RUN apk update
RUN apk add vsftpd

COPY /srcs/vsftpd.conf /etc/vsftpd/

COPY /srcs/cert.pem /etc/ssl/certs/
COPY /srcs/key.pem /etc/ssl/private/

CMD ["vsftpd", "-opasv_min_port=21000", "-opasv_max_port=21010", "-opasv_address=192.168.99.200", "/etc/vsftpd/vsftpd.conf"]
