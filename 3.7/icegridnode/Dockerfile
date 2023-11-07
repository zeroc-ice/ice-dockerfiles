FROM ubuntu:22.04

LABEL maintainer="docker-maintainers@zeroc.com"

ARG ICEGRID_VERSION=3.7.10
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
    zeroc-icegrid=${ICEGRID_VERSION}-* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i '/^Ice.UseSystemdJournal=1/d' /etc/icegridnode.conf \
    && sed -i 's/^IceGrid\.Node\.Data=.*/IceGrid\.Node\.Data=\/var\/lib\/ice\/icegrid/' /etc/icegridnode.conf \
    && sed -i 's/^IceGrid\.Node\.Output=.*/#IceGrid\.Node\.Output=\/var\/lib\/ice\/icegrid/' /etc/icegridnode.conf \
    && sed -i 's/^Ice.Default.Locator=.*/#Ice.Default.Locator=/' /etc/icegridnode.conf \
    && sed -i 's/IceGrid.Node.Endpoints=.*/IceGrid.Node.Endpoints=tcp -h 0\.0\.0\.0/' /etc/icegridnode.conf

EXPOSE 4061 4062

VOLUME ["/var/lib/ice/icegrid"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["icegridnode", "--Ice.Config=/etc/icegridnode.conf"]
