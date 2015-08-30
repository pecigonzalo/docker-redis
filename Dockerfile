FROM linuxserver/baseimage
MAINTAINER Gonzalo Peci <pecigonzalo_docker@outlook.com>
ENV APTLIST="redis-server"

# Installing redis-server
RUN apt-get update -q && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# Configure redis
RUN mkdir /data && chown abc:abc /data
WORKDIR /data

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && \
    chmod -v +x /etc/my_init.d/*.sh


# Volumes and Ports
VOLUME /config
VOLUME /data
EXPOSE 6379/tcp