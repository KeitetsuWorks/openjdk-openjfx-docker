#!/bin/bash -eu

##
## @file        run.sh
## @brief       Script to run the Docker Container
## @author      Keitetsu
## @date        2023/02/06
## @copyright   Copyright (c) 2023 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

xhost +local:root

docker run \
    --interactive \
    --tty \
    --net host \
    --rm \
    --name openjdk-openjfx \
    --env TZ=Asia/Tokyo \
    --env DISPLAY=${DISPLAY} \
    --env NO_AT_BRIDGE=1 \
    --env LIBGL_ALWAYS_INDIRECT=1 \
    --env HOST_USER=${USER} \
    --env HOST_UID=$(id -u ${USER}) \
    --env HOST_GROUP=${USER} \
    --env HOST_GID=$(id -g ${USER}) \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --volume ${HOME}/.Xauthority:/tmp/.Xauthority \
    --volume ${PWD}:/data \
    keitetsu/openjdk-openjfx:21-jdk-bullseye \
