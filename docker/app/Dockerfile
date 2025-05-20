FROM php:8.3-fpm

RUN apt-get update && apt-get install -y     zip unzip curl git libonig-dev libxml2-dev     libzip-dev libpng-dev libjpeg-dev libfreetype6-dev     && docker-php-ext-install pdo_mysql mbstring zip exif pcntl

WORKDIR /var/www