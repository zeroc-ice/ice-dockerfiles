FROM ubuntu:24.04

LABEL maintainer="docker-maintainers@zeroc.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN groupadd -r ice && useradd -r -m -d /var/lib/ice -g ice ice

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    ca-certificates \
    curl \
    gosu \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -fsSL "https://download.zeroc.com/ice/3.8/ubuntu24.04/ice-repo-3.8_1.0_all.deb" -o /tmp/ice-repo.deb \
    && dpkg -i /tmp/ice-repo.deb \
    && rm /tmp/ice-repo.deb \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    zeroc-icegrid \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i '/^Ice.UseSystemdJournal=1/d' /etc/icegridregistry.conf \
    && sed -i 's/^IceGrid\.Registry\.Client\.Endpoints=.*/IceGrid\.Registry\.Client\.Endpoints=tcp -h 0\.0\.0\.0 -p 4061/' /etc/icegridregistry.conf \
    && sed -i 's/^IceGrid\.Registry\.Server\.Endpoints=.*/IceGrid\.Registry\.Server\.Endpoints=tcp -h 0\.0\.0\.0/' /etc/icegridregistry.conf \
    && sed -i 's/^IceGrid\.Registry\.Internal\.Endpoints=.*/IceGrid\.Registry\.Internal\.Endpoints=tcp -h 0\.0\.0\.0/' /etc/icegridregistry.conf

EXPOSE 4061

VOLUME ["/var/lib/ice/icegrid"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["icegridregistry", "--Ice.Config=/etc/icegridregistry.conf"]
