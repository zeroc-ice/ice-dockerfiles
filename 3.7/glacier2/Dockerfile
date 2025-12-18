FROM ubuntu:22.04

LABEL maintainer="docker-maintainers@zeroc.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN groupadd -r ice && useradd -r -g ice ice

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
    zeroc-glacier2 \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i '/^Ice\.UseSystemdJournal=1/d' /etc/glacier2router.conf \
    && sed -i 's/^Glacier2\.Client.Endpoints=.*/Glacier2\.Client\.Endpoints=tcp -h 0\.0\.0\.0 -p 4063/' /etc/glacier2router.conf \
    && sed -i 's/^Glacier2\.Server\.Endpoints=.*/#Glacier2\.Server\.Endpoints=/' /etc/glacier2router.conf

EXPOSE 4063 4064

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["glacier2router", "--Ice.Config=/etc/glacier2router.conf"]
