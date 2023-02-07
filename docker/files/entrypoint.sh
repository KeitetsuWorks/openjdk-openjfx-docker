#!/bin/bash

##
## @file        entrypoint.sh
## @brief       Script for ENTRYPOINT instruction
## @author      Keitetsu
## @date        2019/11/04
## @copyright   Copyright (c) 2019 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

CONTAINER_USER=${HOST_USER:-ubuntu}
CONTAINER_UID=${HOST_UID:-1000}
CONTAINER_GROUP=${HOST_GROUP:-ubuntu}
CONTAINER_GID=${HOST_GID:-1000}
echo "Starting with USER: ${CONTAINER_USER}, UID: ${CONTAINER_UID}, GROUP: ${CONTAINER_GROUP}, GID: ${CONTAINER_GID}"

getent passwd ${CONTAINER_USER} 2>&1 > /dev/null
USER_EXISTS=$?
getent passwd ${CONTAINER_UID} 2>&1 > /dev/null
UID_EXISTS=$?
getent group ${CONTAINER_GROUP} 2>&1 > /dev/null
GROUP_EXISTS=$?
getent group ${CONTAINER_GID} 2>&1 > /dev/null
GID_EXISTS=$?

if [[ ${GROUP_EXISTS} -ne 0 && ${GID_EXISTS} -ne 0 ]]; then
    groupadd \
        --gid ${CONTAINER_GID} \
        ${CONTAINER_GROUP}
fi

if [[ ${USER_EXISTS} -ne 0 && ${UID_EXISTS} -ne 0 ]]; then
    useradd \
        --uid ${CONTAINER_UID} \
        --gid ${CONTAINER_GID} \
        --create-home \
        --home-dir /home/${CONTAINER_USER} \
        --shell /bin/bash \
        ${CONTAINER_USER}
    usermod -aG sudo ${CONTAINER_USER}
    echo ${CONTAINER_USER}:${CONTAINER_USER} | chpasswd
fi

cp /tmp/.Xauthority /home/${CONTAINER_USER}
chown ${CONTAINER_USER} /home/${CONTAINER_USER}/.Xauthority

chown ${CONTAINER_USER} $(tty)

exec /usr/sbin/gosu "${CONTAINER_USER}" "$@"
