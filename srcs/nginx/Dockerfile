FROM alpine:latest

EXPOSE 22 80 443

RUN apk update

# nginx

RUN apk	add nginx

RUN adduser -D -g 'www' www

RUN chown -R www:www /var/lib/nginx

RUN mkdir -p /run/nginx

COPY /srcs/nginx.conf /etc/nginx
COPY /srcs/cert.pem /etc/ssl/certs/
COPY /srcs/key.pem /etc/ssl/private/

RUN nginx -t

# ssh

RUN apk add openssh openrc

RUN adduser -S admin --shell /bin/sh
RUN echo "admin:admin" | chpasswd
RUN chown -R admin /home/admin

RUN mkdir -p /var/run/sshd
RUN rc-update add sshd
RUN rc-status
RUN touch /run/openrc/softlevel

COPY /srcs/nginx_setup.sh /tmp

CMD ["/bin/sh", "tmp/nginx_setup.sh"]
