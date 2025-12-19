FROM ubuntu:16.04

LABEL maintainer="docker-maintainers@zeroc.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 5E6DA83306132997 \
    && echo "deb http://download.zeroc.com/Ice/3.6/ubuntu16.04 stable main" >> /etc/apt/sources.list.d/ice.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    zeroc-icebox \
    libzeroc-icestorm3.6 \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/icebox", "--IceBox.Service.IceStorm=IceStormService,36:createIceStorm \
    --Ice.Config=/etc/icestorm.conf \
    --Freeze.DbEnv.IceStorm.DbHome=/data"]
