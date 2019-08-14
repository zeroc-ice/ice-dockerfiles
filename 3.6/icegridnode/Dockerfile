FROM ubuntu:16.04

MAINTAINER ZeroC, Inc. docker-maintainers@zeroc.com

ENV ICEGRID_VERSION 3.6.5

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 5E6DA83306132997 \
    && echo "deb http://download.zeroc.com/Ice/3.6/ubuntu16.04 stable main" >> /etc/apt/sources.list.d/ice.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        zeroc-icegrid=${ICEGRID_VERSION}-* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4061 4062

VOLUME ["/var/lib/ice/icegrid"]

ENTRYPOINT ["/usr/bin/icegridnode", "--Ice.Config=/etc/icegridnode.conf", "--IceGrid.Node.Data=/var/lib/ice/icegrid"]
