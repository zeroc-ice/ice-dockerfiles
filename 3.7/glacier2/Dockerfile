FROM ubuntu:16.04

MAINTAINER ZeroC, Inc. docker-maintainers@zeroc.com

ENV GLACIER2_VERSION 3.7.3

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv B6391CB2CFBA643D \
    && echo "deb http://download.zeroc.com/Ice/3.7/ubuntu16.04 stable main" >> /etc/apt/sources.list.d/ice.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        zeroc-glacier2=${GLACIER2_VERSION}-* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4063 4064

ENTRYPOINT ["/usr/bin/glacier2router", "--Ice.Config=/etc/glacier2router.conf"]
