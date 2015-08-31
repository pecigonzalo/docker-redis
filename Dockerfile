FROM linuxserver/baseimage
MAINTAINER Gonzalo Peci <pecigonzalo_docker@outlook.com>
ENV APTLIST="redis-server"

# Installing redis-server
RUN add-apt-repository ppa:chris-lea/redis-server && \
    apt-get update -q && \
    apt-get install -qy $APTLIST && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/ /defaults/
RUN chmod -v +x /etc/service/*/run && \
    chmod -v +x /etc/my_init.d/*.sh && \
# Configure redis
    mkdir /data && \
    rm -rf /var/lib/redis && \
    ln -s /data /var/lib/redis && \
    mkdir /config && \
    rm -rf /etc/redis && \
    ln -s /config /etc/redis

# Volumes and Ports
VOLUME /config
VOLUME /data
EXPOSE 6379/tcp
