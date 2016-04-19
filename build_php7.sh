#!/bin/bash

# Based on https://www.howtoforge.com/tutorial/install-php-7-on-debian-8-jessie/

VERSION=$1

# Those are needed to build PHP 7 from source
# sudo apt-get install build-essential
# sudo apt-get install libfcgi-dev libfcgi0ldbl libjpeg62-turbo-dbg libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev

cd /home/pi/Downloads/BuildSrc/php7

wget http://php.net/distributions/php-${VERSION}.tar.bz2 .

tar jxf php-${VERSION}.tar.bz2

cd php-${VERSION}

./configure --prefix=/opt/php7 --enable-fpm --with-libxml-dir=/usr --enable-bcmath --enable-exif --enable-intl --enable-calendar --enable-zip --enable-soap --enable-ftp --enable-pcntl --enable-mbstring --with-openssl --with-curl --with-pdo-mysql=mysqlnd --with-mcrypt --with-zlib --with-bz2 --with-config-file-path=/opt/php7/etc/ --with-config-file-scan-dir=/opt/php7/etc/modules/ --with-jpeg-dir=/usr --with-png-dir=/usr --with-gettext --with-xsl

make

sudo make install

# Get composer
cd /opt/php7/bin

sudo rm -f composer.phar

sudo wget https://getcomposer.org/download/1.0.1/composer.phar

sudo chmod +x composer.phar
