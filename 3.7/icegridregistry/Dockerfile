FROM ubuntu:22.04

LABEL maintainer="docker-maintainers@zeroc.com"

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
    zeroc-icegrid \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i '/^Ice.UseSystemdJournal=1/d' /etc/icegridregistry.conf \
    && sed -i 's/^IceGrid\.Registry\.Client\.Endpoints=.*/IceGrid\.Registry\.Client\.Endpoints=tcp -h 0\.0\.0\.0 -p 4061/' /etc/icegridregistry.conf \
    && sed -i 's/^IceGrid\.Registry\.Server\.Endpoints=.*/IceGrid\.Registry\.Server\.Endpoints=tcp -h 0\.0\.0\.0/' /etc/icegridregistry.conf \
    && sed -i 's/^IceGrid\.Registry\.Internal\.Endpoints=.*/IceGrid\.Registry\.Internal\.Endpoints=tcp -h 0\.0\.0\.0/' /etc/icegridregistry.conf

EXPOSE 4061 4062

VOLUME ["/var/lib/ice/icegrid/"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["icegridregistry", "--Ice.Config=/etc/icegridregistry.conf"]
