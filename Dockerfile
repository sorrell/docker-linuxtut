FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get dist-upgrade --assume-yes

RUN apt-get install --assume-yes --no-install-recommends --no-install-suggests \
    apt-transport-https \
    apt-utils \
    build-essential \
    ca-certificates \
    curl \
    git \
    gnupg2 \
    groff \
    language-pack-en \
    python3 \
    python3-pip \
    ssh \
    sudo \
    tmux \
    unzip \
    vim \
    zip

RUN update-locale

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get purge --assume-yes --auto-remove \
    --option APT::AutoRemove::RecommendsImportant=false \
    --option APT::AutoRemove::SuggestsImportant=false
RUN rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN useradd -ms /bin/bash newuser