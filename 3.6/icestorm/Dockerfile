FROM debian:jessie

MAINTAINER ZeroC, Inc. docker-maintainers@zeroc.com

ENV ICEBOX_VERSION 3.6.2

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 5E6DA83306132997 \
    && echo "deb http://download.zeroc.com/apt/debian8 stable main" >> /etc/apt/sources.list.d/ice.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        zeroc-icebox=${ICEBOX_VERSION}-* \
        libzeroc-icestorm3.6=${ICEBOX_VERSION}-* \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/icebox", "--IceBox.Service.IceStorm=IceStormService,36:createIceStorm \
                                                          --Ice.Config=/config.icestorm \
                                                          --Freeze.DbEnv.IceStorm.DbHome=/data"]
