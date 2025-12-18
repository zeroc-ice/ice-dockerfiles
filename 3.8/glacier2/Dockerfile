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
    zeroc-glacier2 \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i '/^Ice\.UseSystemdJournal=1/d' /etc/glacier2router.conf \
    && sed -i 's/^Glacier2\.Client.Endpoints=.*/Glacier2\.Client\.Endpoints=tcp -h 0\.0\.0\.0 -p 4063/' /etc/glacier2router.conf \
    && sed -i 's/^Glacier2\.Server\.Endpoints=*/#Glacier2\.Server\.Endpoints=/' /etc/glacier2router.conf

EXPOSE 4063 4064

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["glacier2router", "--Ice.Config=/etc/glacier2router.conf"]
