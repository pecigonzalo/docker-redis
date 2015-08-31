#!/bin/bash

# If redi.conf file is missing copy one from the default
if [ ! -f /config/redis.conf ]; then
  cp /etc/redis/redis.conf /config/redis.conf
  chown abc:abc /config/redis.conf && chmod 774 /config/redis.conf
fi

# Creat data dir and ensure ownership
if [ ! -f /data ]; then
    mkdir /data
fi
chown abc -R /data

# Create config dir and ensure ownership
if [ ! -f /config ]; then
    mkdir /config
fi
chown abc -R /config


if [ -f /etc/redis ]; then
    rm -rf /etc/redis.bkp && \
    mv /etc/redis /etc/redis.bkp
    rm -rf /etc/redis && \
    ln -s /config /etc/redis
fi
