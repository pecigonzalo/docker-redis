#!/bin/bash

# If redi.conf file is missing copy one from the default
if [ ! -f /config/redis.conf ]; then
  cp /etc/redis/redis.conf /config/redis.conf
  chown abc:abc /config/redis.conf && chmod 774 /config/redis.conf
fi

# Creat data dir and ensure ownership
mkdir -p /data && chown abc -R /data

# Create config dir and ensure ownership
mkdir -p /config && chown abc -R /config
