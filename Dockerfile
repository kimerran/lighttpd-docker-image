FROM alpine:latest
WORKDIR /var/www/

RUN apk update
RUN apk add lighttpd

COPY basic.conf /etc/lighttpd/
COPY index.html /var/www

EXPOSE 80

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/basic.conf"]
