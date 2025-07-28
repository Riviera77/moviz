#!/bin/sh
# Démarrer PHP-FPM (en mode socket) et Nginx

php-fpm -y /usr/local/etc/php-fpm.conf -R &
nginx -g "daemon off;"