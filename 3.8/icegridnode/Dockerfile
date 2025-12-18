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
