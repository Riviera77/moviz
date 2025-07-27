#!/bin/sh

# Démarrer PHP-FPM en arrière-plan
php-fpm &

# Lancer NGINX en mode "foreground" (important pour Render)
nginx -g 'daemon off;'