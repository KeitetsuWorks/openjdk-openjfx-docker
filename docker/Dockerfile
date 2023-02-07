##
## @file        Dockerfile
## @brief       Dockerfile for JavaFX
## @author      Keitetsu
## @date        2023/02/06
## @copyright   Copyright (c) 2023 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

FROM openjdk:21-jdk-bullseye

LABEL maintainer="KeitetsuWorks@users.noreply.github.com"

##
## install dependencies
##
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq --no-install-recommends \
    gosu \
    sudo \
    apt-utils \
    locales \
    locales-all \
    wget \
    gzip \
    tar \
    unzip \
    x11-utils \
    libgtk-3-0 \
    libcanberra-gtk3-module \
    git && \
    \
    apt-get clean && \
    apt-get autoclean && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

##
## install JavaFX
## https://gluonhq.com/products/javafx/
## https://openjfx.io/openjfx-docs/#install-javafx
##
RUN cd /tmp && \
    wget https://download2.gluonhq.com/openjfx/19.0.2.1/openjfx-19.0.2.1_linux-x64_bin-sdk.zip && \
    unzip openjfx-19.0.2.1_linux-x64_bin-sdk.zip && \
    mv javafx-sdk-19.0.2.1/ /usr/local/lib/ && \
    rm -rf /tmp/*
ENV PATH_TO_FX=/usr/local/lib/javafx-sdk-19.0.2.1/lib \
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib/javafx-sdk-19.0.2.1/lib

##
## locale settings
##
RUN locale-gen en_US.UTF-8 && \
    update-locale
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

##
## ENTRYPOINT settings
##
COPY files/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN mkdir -p /data
WORKDIR /data

CMD ["/bin/bash"]
