# Dockerfile Moviz modifié pour déploiement sur Render.com
# Étape 1 : Image de base PHP avec Alpine avec FPM et Alpine
FROM php:8.3.20-fpm-alpine

# Étape 2 : Installation des dépendances système
RUN apk add --no-cache \
    nginx \
    autoconf \
    bash \
    bzip2-dev \
    coreutils \
    gcc \
    g++ \
    icu-dev \
    libxml2-dev \
    libzip-dev \
    libpng-dev \
    make \
    musl-dev \
    nodejs \
    npm \
    openssl \
    zlib-dev \
    unzip \
    php-pear \
    git \
    curl \
&& mkdir -p /run/nginx

# Étape 3 : Installer les extensions PHP nécessaires
RUN docker-php-ext-install \
    zip \
    pdo \
    pdo_mysql \
    opcache \
    intl \
    bcmath

# Étape 4 : Nettoyer les fichiers temporaires
RUN rm -rf /tmp/* /var/cache/apk/*

# Étape 5 : Installe Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Définis le répertoire de travail
WORKDIR /var/www/html

# Copie les fichiers nécessaires pour installer les deps
COPY composer.lock composer.json ./
RUN composer install --no-interaction --no-dev --optimize-autoloader \
    && composer clear-cache

# Étape 6 : Copier le projet dans le conteneur - 
COPY . .

# Copier config nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Exposer le port 80 (for Render to detect traffic HTTP)
EXPOSE 80

# Commande de démarrage
CMD ["sh", "/start.sh"]
