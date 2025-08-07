# Dockerfile Moviz (deployment with Heroku)

FROM php:8.2-fpm

# Variables environment for composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_HOME=/composer

# Install dependencies system
RUN apt-get update && apt-get install -y \
    git unzip zip curl libpq-dev libicu-dev libzip-dev libpng-dev \
    && docker-php-ext-install intl pdo pdo_pgsql zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create repository for the application
WORKDIR /var/www/html

# Copy the project
COPY . .

# Install the dependencies of PHP
RUN composer install --no-dev --optimize-autoloader

# Set permissions for Symfony cache/log dirs
RUN mkdir -p var && chown -R www-data:www-data var

# Port Heroku
EXPOSE 8080

CMD ["sh", "-c", "php -S 0.0.0.0:$PORT -t public"]