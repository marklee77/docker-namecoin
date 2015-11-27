FROM ubuntu:trusty
MAINTAINER Mark Stillwell <mark@stillwell.me>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install \
        curl \
        python-bottle \
        python-pip \
        supervisord && \
    curl -sL http://download.opensuse.org/repositories/home:p_conrad:coins/xUbuntu_14.04/Release.key | apt-key add - && \
    echo 'deb http://download.opensuse.org/repositories/home:/p_conrad:/coins/xUbuntu_14.04/ /' > /etc/apt/sources.list.d/namecoin.list && \
    apt-get update && \
    apt-get -y install namecoin && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN useradd -m -s /bin/bash namecoin

USER namecoin
WORKDIR /home/namecoin

RUN mkdir -p ~/.namecoin && \
    echo "rpcuser=`whoami`" >> ~/.namecoin/namecoin.conf && \
    echo "rpcpassword=`openssl rand -hex 30/`" >> ~/.namecoin/namecoin.conf && \
    echo "rpcport=8336" >> ~/.namecoin/namecoin.conf

VOLUME /home/namecoin

EXPOSE 8334 8336

CMD namecoind -printtoconsole
