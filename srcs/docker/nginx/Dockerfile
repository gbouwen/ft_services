FROM alpine

EXPOSE 80 443

RUN apk update && apk add nginx

RUN apk add openrc --no-cache

RUN adduser -D -g 'www' www

RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx

COPY index.html /www

COPY cert.pem /etc/ssl/certs
COPY key.pem /etc/ssl/private
COPY nginx.conf /etc/nginx/nginx.conf

RUN nginx -t

CMD ["nginx", "-g", "daemon off;"]
