FROM debian:jessie

MAINTAINER ZeroC, Inc. docker-maintainers@zeroc.com

ENV GLACIER2_VERSION 3.6.3

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 5E6DA83306132997 \
    && echo "deb http://download.zeroc.com/apt/debian8 stable main" >> /etc/apt/sources.list.d/ice.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        zeroc-glacier2=${GLACIER2_VERSION}-* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4063 4064

ENTRYPOINT ["/usr/bin/glacier2router", "--Ice.Config=/etc/glacier2router.conf"]
