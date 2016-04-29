#!/bin/bash

# Get composer
cd /opt/php7/bin

if [ ! -f composer.phar ]; then
    sudo wget https://getcomposer.org/download/1.0.0/composer.phar
    sudo chmod +x composer.phar
fi

# Try to update to latest version
sudo php composer.phar self-update
