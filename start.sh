#!/bin/sh

# Démarrer PHP-FPM
php-fpm &
if [ $? -ne 0 ]; then
    echo "Erreur : Échec du démarrage de PHP-FPM"
    exit 1
fi

# Démarrer Nginx
nginx -g "daemon off;"
if [ $? -ne 0 ]; then
    echo "Erreur : Échec du démarrage de Nginx"
    exit 1
fi