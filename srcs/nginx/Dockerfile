FROM alpine:latest

EXPOSE 80 443

RUN apk update
RUN apk	add nginx

RUN adduser -D -g 'www' www

RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx

COPY /srcs/nginx.conf /etc/nginx
COPY /srcs/index.html /www
COPY /srcs/cert.pem /etc/ssl/certs/
COPY /srcs/key.pem /etc/ssl/private/

RUN nginx -t

CMD ["nginx", "-g", "daemon off;"]
