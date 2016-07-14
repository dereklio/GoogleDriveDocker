FROM ubuntu:16.04
MAINTAINER Deryck Lio <d@derycklio.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install software-properties-common python-software-properties

# Install grive2, which talks to Google Drive. Refers to the below URLs for more information.
# - http://yourcmc.ru/wiki/Grive2
# - https://github.com/vitalif/grive2
# - http://www.ubuntuupdates.org/package/webupd8/xenial/main/base/grive
RUN add-apt-repository ppa:nilarimogard/webupd8
RUN apt-get -y update
RUN apt-get -y install grive

ENV GRIVE_SYNC_INTERVAL=1

# Create and expose volumes for Google Drive sync
ENV CONFIG_DIR=/data/config
ENV SYNC_DIR=/data/drive

VOLUME $CONFIG_DIR $SYNC_DIR
WORKDIR $SYNC_DIR

ADD ./grive-daemon.sh /usr/local/bin/grive-daemon
ADD ./auth.sh /usr/local/bin/auth

RUN chmod a+x /usr/local/bin/grive-daemon
RUN chmod a+x /usr/local/bin/auth

ENTRYPOINT ["/usr/local/bin/grive-daemon"]
