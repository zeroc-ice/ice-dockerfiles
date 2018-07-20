#
# Ice Ubuntu 16.04 Base CI Docker container
#
FROM ubuntu:16.04

ENV DOTNET_SDK_VERSION 2.1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
        build-essential \
        dh-systemd \
        git \
        packaging-dev \
        locales \
        software-properties-common \
        python-software-properties \
        apt-transport-https && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Third party repos
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv BC528686B50D79E339D3721CEB3E94ADBE1229CF && \
    apt-add-repository "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main"

# Dependencies
RUN apt-get update && \
    apt-get install -y \
        libbluetooth-dev \
        libbz2-dev \
        libdb++-dev \
        libdb-dev \
        default-jdk \
        dotnet-sdk-${DOTNET_SDK_VERSION} \
        libdb-java-dev \
        libdbus-glib-1-dev \
        libexpat-dev \
        liblmdb-dev \
        libmcpp-dev \
        libssl-dev \
        nodejs \
        openssl \
        php-cli \
        php-dev \
        python \
        python-dev \
        python-pip \
        python3 \
        python3-dev \
        python3-pip \
        ruby \
        ruby-dev && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN python -m pip install --upgrade pip && \
    python -m pip install passlib

RUN useradd -ms /bin/bash testuser
ONBUILD COPY . /home/testuser
ONBUILD RUN chown -R testuser:testuser /home/testuser
ONBUILD USER testuser
ONBUILD WORKDIR /home/testuser
