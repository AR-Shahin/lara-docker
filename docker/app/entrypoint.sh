#!/bin/bash

# Wait for MySQL or other services (optional delay)
sleep 5

# Install composer dependencies
composer install --no-interaction --prefer-dist --optimize-autoloader

# Laravel setup
php artisan config:clear
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan key:generate
php artisan migrate --force

# Set permissions (optional)
chown -R www-data:www-data /var/www
chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Run php-fpm
exec php-fpm
