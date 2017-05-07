FROM alpine:latest
MAINTAINER mneri@krispsystems.com

WORKDIR /var/code

RUN apk update
RUN apk add lighttpd



COPY basic.conf /etc/lighttpd/
COPY index.html /var/www
COPY server.sh /var/code

EXPOSE 80

#ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/basic.conf"]
ENTRYPOINT ["/bin/sh"]

CMD ["/var/code/server.sh"]
