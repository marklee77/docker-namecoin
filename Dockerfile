FROM ubuntu:trusty
MAINTAINER Mark Stillwell <mark@stillwell.me>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install curl && \
    curl -s http://download.opensuse.org/repositories/home:p_conrad:coins/xUbuntu_14.04/Release.key | apt-key add - && \
    apt-add-repository 'deb http://download.opensuse.org/repositories/home:/p_conrad:/coins/xUbuntu_14.04/ /' && \
    apt-get update && \
    apt-get install namecoin && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*
