FROM php:8.3-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
    zip unzip curl git libonig-dev libxml2-dev \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    libcurl4-openssl-dev libssl-dev nano \
    && docker-php-ext-configure zip \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY ./docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 9000
