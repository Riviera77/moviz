# Dockerfile
# Étape 1 : Image de base PHP avec Alpine avec FPM et Alpine
FROM php:8.3.20-fpm-alpine

# Étape 2 : Installation des dépendances système
RUN apk add --no-cache \
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
    curl

# Étape 3 : Installer les extensions PHP nécessaires
RUN docker-php-ext-install \
    zip \
    pdo_mysql \
    opcache \
    intl \
    bcmath

# Étape 4 : Nettoyer les fichiers temporaires
RUN rm -rf /tmp/* /var/cache/apk/*

# Étape 5 : Installe Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Étape 6 : Copier les sources dans le conteneur - 
COPY . /var/www/html
# Définis le répertoire de travail
WORKDIR /var/www/html