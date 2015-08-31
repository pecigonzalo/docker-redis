#!/bin/bash

if [ ! -f /data ]; then
    mkdir /data
fi

if [ -f /var/lib/redis ]; then
    rm -rf /var/lib/redis && \
    ln -s /data /var/lib/redis
fi

if [ ! -f /config ]; then
    mkdir /config
fi

if [ -f /etc/redis ]; then
    rm -rf /etc/redis && \
    ln -s /config /etc/redis
fi
