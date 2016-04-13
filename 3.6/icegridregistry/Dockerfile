FROM ubuntu:14.04

MAINTAINER ZeroC, Inc. docker-maintainers@zeroc.com

ENV ICEGRID_VERSION 3.6.2

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 5E6DA83306132997 \
    && echo "deb http://zeroc.com/download/apt/ubuntu14.04 stable main" >> /etc/apt/sources.list.d/ice.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
            zeroc-icegrid=${ICEGRID_VERSION}-* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4061 4062

VOLUME ["/var/lib/ice/icegrid"]

ENTRYPOINT ["/usr/bin/icegridregistry", "--Ice.Config=/etc/icegridregistry.conf"]
