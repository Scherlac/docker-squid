FROM ubuntu:22.04
MAINTAINER Scherman Laszlo "scherlac@gmail.com"


ENV DEBIAN_FRONTEND=noninteractive

COPY docker-entrypoint.sh /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	sudo \
	squid \
    && mkdir -p /var/cache/squid \
    && chmod +x /docker-entrypoint.sh

COPY conf/squid.conf /etc/squid/squid.conf

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "squid" ]
EXPOSE 3128 3130
