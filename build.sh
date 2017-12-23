#!/bin/bash
set -e

DEBIAN_FRONTEND=noninteractive

useradd -c NFSEN -G www-data netflow

mkdir -p /var/www
ln -s /var/www/nfsen /var/www/html

apt-get -y install build-essential flex bison rrdtool librrds-perl libmailtools-perl libsocket6-perl librrd-dev lighttpd php5-cgi php5-cli wget

lighttpd-enable-mod fastcgi-php

#php http?
#xdrum/nginx-extras

mkdir -p /build

cd /build
wget http://sourceforge.net/projects/nfdump/files/stable/nfdump-1.6.13/nfdump-1.6.13.tar.gz
tar -xzf nfdump-1.6.13.tar.gz
cd nfdump-1.6.13
# clean ugly mac files
find . | grep "\\._" | xargs rm

./configure --enable-nfprofile --enable-sflow
make && make install

cd /build
wget http://sourceforge.net/projects/nfsen/files/stable/nfsen-1.3.7/nfsen-1.3.7.tar.gz
tar -xzf nfsen-1.3.7.tar.gz
cd nfsen-1.3.7
# clean ugly mac files
find . | grep "\\._" | xargs rm


mkdir /data

#cp /nfsen.conf etc/nfsen.conf
#./install.pl etc/nfsen.conf

