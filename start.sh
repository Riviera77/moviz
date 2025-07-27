#!/bin/sh
set -e

# Lancer PHP-FPM en arrière-plan
php-fpm -D

# Lancer nginx en avant-plan (IMPORTANT)
nginx -g "daemon off;"