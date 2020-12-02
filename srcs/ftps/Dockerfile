FROM alpine:latest

EXPOSE 20 21 40000

RUN apk update
RUN apk add vsftpd

RUN adduser -S admin
RUN echo "admin:admin" | chpasswd
RUN chown -R admin /home/admin

COPY /srcs/vsftpd.conf /etc/vsftpd/

COPY /srcs/cert.pem /etc/ssl/certs/
COPY /srcs/key.pem /etc/ssl/private/

VOLUME /home/admin

CMD ["vsftpd", "-opasv_min_port=40000", "-opasv_max_port=40000", "-opasv_address=192.168.99.200", "/etc/vsftpd/vsftpd.conf"]
