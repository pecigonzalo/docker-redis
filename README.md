![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](http://linuxserver.io) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](http://forum.linuxserver.io) or for real-time support our [IRC](http://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/redis

![](http://redis.io/images/redis-white.png)

Redis is an open source, BSD licensed, advanced key-value cache and store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.
[Redis Documents](http://redis.io/documentation)

## Usage

```
docker create \
  --name=redis \
  -e PUID=<UID> -e PGID=<GID> \
  -p 6379:6379 \
  -v /etc/localtime:/etc/localtime:ro \
  -v <path to data>:/config \
  linuxserver/redis
```

**Parameters**

* `-p 6379` - default redis port
* `-v /etc/localhost` for timesync - *optional*
* `-v /config` - redis.conf storage directory - *optional*
* `-v /data` - redis db persistant storage directory - *optional*
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it quassel-core /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Setting up the application

The application setup is done through the redis.conf file but the following parameters are replaced on startup:
* `daemonize` - is set to NO
* `bind` - is set to 0.0.0.0
* `logfile` - is set to empty from /var/log/redis/redis-server.log but you can set it to anything else, altough this might prevent it from logging to the console *optional*

## Updates

* Upgrade to the latest version simply `docker restart <container-name>`.
* To monitor the logs of the container in realtime `docker logs -f <container-name>`.

## Versions

+ **15.10.2015:** Initial release.
