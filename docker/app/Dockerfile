FROM php:8.3-fpm

WORKDIR /var/www

# System packages
RUN apt-get update && apt-get install -y \
    zip unzip curl git libonig-dev libxml2-dev \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    libcurl4-openssl-dev libssl-dev nano \
    && docker-php-ext-configure zip \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy Laravel project
COPY ./laravel /var/www

# Copy entrypoint
COPY ./docker/app/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Permissions
RUN chown -R www-data:www-data /var/www

EXPOSE 9000

ENTRYPOINT ["entrypoint.sh"]
