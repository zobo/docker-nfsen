FROM debian:jessie
MAINTAINER Damjan Cvetko <damjan.cvetko@monotek.net>

RUN DEBIANFRONTEND=noninteractive apt-get -qq update

# COPY local internal
# ADD local internal ?
# RUN cmd

ADD nfdump-1.6.13.tar.gz /build
ADD nfsen-1.3.7.tar.gz /build
ADD build.sh /build.sh
ADD run.sh /run.sh
ADD nfsen.conf /nfsen.conf
ADD gen_conf.php /gen_conf.php
RUN chmod +x /run.sh /build.sh ; sync ; sleep 1; /build.sh

WORKDIR /

ENTRYPOINT ["/run.sh"]
