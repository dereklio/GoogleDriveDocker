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

# Exposed volume for Google Drive sync
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

ADD ./gdrive-init.sh /usr/local/bin/gdrive-init.sh
RUN chmod a+x /usr/local/bin/gdrive-init.sh

ENTRYPOINT ["/usr/local/bin/gdrive-init.sh"]
