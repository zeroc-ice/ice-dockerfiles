FROM ubuntu:16.04

LABEL maintainer="docker-maintainers@zeroc.com"

ARG ICEBOX_VERSION=3.7.5

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv B6391CB2CFBA643D \
    && echo "deb http://download.zeroc.com/Ice/3.7/ubuntu16.04 stable main" >> /etc/apt/sources.list.d/ice.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        zeroc-icebox=${ICEBOX_VERSION}-* \
        libzeroc-icestorm3.7=${ICEBOX_VERSION}-* \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/icebox", "--IceBox.Service.IceStorm=IceStormService,37:createIceStorm \
                                                          --Ice.Config=/etc/icestorm.conf \
                                                          --Freeze.DbEnv.IceStorm.DbHome=/data"]
