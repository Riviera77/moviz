# --- 1) Build des assets (Node) ---
FROM node:18 AS assets
WORKDIR /app

# Installer dépendances front
COPY package*.json ./
RUN npm ci

# Copier sources front & config webpack
COPY webpack.config.js ./
COPY assets ./assets

# Le build Encore écrit dans public/build
RUN npm run build

# --- 2) Runtime PHP (Symfony) ---
FROM php:8.2-fpm

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_HOME=/composer

RUN apt-get update && apt-get install -y \
    git unzip zip curl libpq-dev libicu-dev libzip-dev libpng-dev \
    && docker-php-ext-install intl pdo pdo_pgsql zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

# Copier le code PHP
COPY . .

# (On ne lance PAS npm ici)
# Composer (prod)
RUN composer install --no-dev --optimize-autoloader

# Copier le build généré à l’étape Node
COPY --from=assets /app/public/build ./public/build

# Permissions cache/log Symfony
RUN mkdir -p var && chown -R www-data:www-data var

EXPOSE 8080
CMD ["sh", "-c", "php -S 0.0.0.0:$PORT -t public"]