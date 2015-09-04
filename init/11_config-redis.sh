#!/bin/bash

# If redi.conf file is missing copy one from the default
if [ ! -f /config/redis.conf ]; then
  cp /etc/redis/redis.conf /config/redis.conf
  chown abc:abc /config/redis.conf && chmod 774 /config/redis.conf
  sed 's/^daemonize yes/daemonize no/' -i /config/redis.conf
  sed 's/^bind 127.0.0.1/bind 0.0.0.0/' -i /config/redis.conf
  sed 's/^logfile \/var\/log\/redis\/redis-server.log/logfile \"\"/' -i /config/redis.conf
fi

# Creat data dir and ensure ownership
mkdir -p /data && chown abc -R /data

# Create config dir and ensure ownership
mkdir -p /config && chown abc -R /config
