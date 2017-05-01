#!/bin/bash

PHP_DIR=/opt/php7

# Get composer
cd $PHP_DIR/bin

if [ ! -f composer.phar ]; then
    sudo wget https://getcomposer.org/download/1.0.0/composer.phar
    sudo chmod +x composer.phar
fi

# Try to update to latest version
sudo $PHP_DIR/bin/php composer.phar self-update

# Link composer.phar if needed
if [ ! -L /usr/local/bin/composer ]; then
    sudo ln -s $PHP_DIR/bin/composer.phar /usr/local/bin/composer
fi
