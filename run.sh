#!/bin/bash

# process config and install

#cp /app/nfsen.conf /build/nfsen-1.3.7/etc/
php /gen_conf.php > /build/nfsen-1.3.7/etc/nfsen.conf
cd /build/nfsen-1.3.7
echo | ./install.pl etc/nfsen.conf

# start nfsen

/usr/local/nfsen/bin/nfsen start

# start httpd

/etc/init.d/lighttpd start

# setup web

ln -s nfsen.php /var/www/nfsen/index.php
rm -rf /var/www/html
ln -s /var/www/nfsen /var/www/html

# block
sleep infinity