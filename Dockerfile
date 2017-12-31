FROM debian:stretch-slim
MAINTAINER Alexander 'Polynomdivision'

ADD https://download-cdn.resilio.com/2.5.10/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && \
    rm -f /tmp/sync.tgz && \
    apt-get update && \
    apt-get install -y gosu

COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

EXPOSE 8888
EXPOSE 55555

VOLUME /home/user/sync

ENTRYPOINT ["run_sync"]
CMD ["--config", "/home/user/sync/sync.conf"]
