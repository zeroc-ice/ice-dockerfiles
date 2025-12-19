FROM ubuntu:16.04

LABEL maintainer="docker-maintainers@zeroc.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 5E6DA83306132997 \
    && echo "deb http://download.zeroc.com/ice/3.6/ubuntu16.04 stable main" >> /etc/apt/sources.list.d/ice.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    zeroc-icegrid \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4061

VOLUME ["/var/lib/ice/icegrid"]

ENTRYPOINT ["/usr/bin/icegridnode", "--Ice.Config=/etc/icegridnode.conf", "--IceGrid.Node.Data=/var/lib/ice/icegrid"]
