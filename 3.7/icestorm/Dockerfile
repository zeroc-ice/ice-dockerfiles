FROM ubuntu:22.04

LABEL maintainer="docker-maintainers@zeroc.com"

ARG ICEBOX_VERSION=3.7.9
ARG DEBIAN_FRONTEND=noninteractive

RUN groupadd -r ice && useradd -r -m -d /var/lib/ice -g ice ice

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    ca-certificates \
    curl \
    gpg \
    gosu \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://zeroc.com/download/GPG-KEY-zeroc-release-B6391CB2CFBA643D |  gpg --dearmor -o /etc/apt/keyrings/zeroc.gpg \
    && echo \
    "deb [signed-by=/etc/apt/keyrings/zeroc.gpg] https://zeroc.com/download/ice/3.7/ubuntu22.04 stable main" | tee /etc/apt/sources.list.d/zeroc-ice-3.7.list

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    zeroc-icebox=${ICEBOX_VERSION}-* \
    libzeroc-icestorm3.7=${ICEBOX_VERSION}-* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["icebox", "--IceBox.Service.IceStorm=IceStormService,37:createIceStorm", "--IceStorm.LMDB.Path=/data"]
