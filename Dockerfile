FROM alpine:latest
MAINTAINER mh.neri@gmail.com

WORKDIR /var/code

RUN apk update
RUN apk add lighttpd

COPY basic.conf /etc/lighttpd/
COPY index.html /var/www
COPY server.sh /var/code

EXPOSE 80

ENTRYPOINT ["/bin/sh"]

CMD ["/var/code/server.sh"]
