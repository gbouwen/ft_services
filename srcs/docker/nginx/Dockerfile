FROM alpine

EXPOSE 80 443

# Install nginx
RUN apk update && apk add nginx

# Install openrc
RUN apk add openrc --no-cache

# Create new user and group www for nginx
RUN adduser -D -g 'www' www

# Create a directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx

# Copy index.html to /www
COPY index.html /www

# Copy SSL certificate to the container
COPY cert.pem /etc/ssl/certs

# Copy SSL key to the container
COPY key.pem /etc/ssl/private

# Copy configfile to container
COPY nginx.conf /etc/nginx/nginx.conf

RUN nginx -t

CMD ["nginx", "-g", "daemon off;"]
