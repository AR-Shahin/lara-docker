FROM php:8.3-fpm

# Set working directory
WORKDIR /var/www

# Install system dependencies
RUN apt-get update && apt-get install -y \
    zip unzip curl git libonig-dev libxml2-dev \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev \
    libcurl4-openssl-dev libssl-dev gnupg nano \
    && docker-php-ext-configure zip \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl

# Install Composer (latest)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Node.js + npm (optional, if needed for frontend)
# RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
#     apt-get install -y nodejs

# Copy existing Laravel project
COPY ./laravel /var/www

# Set permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Expose port (used internally)
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
