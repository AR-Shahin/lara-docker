#!/bin/bash

cd /var/www

# Copy .env if not already present
if [ ! -f ".env" ]; then
  cp .env.example .env
fi

# Install Composer dependencies
composer install --no-interaction --prefer-dist

# Laravel setup
php artisan key:generate
php artisan config:clear
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Only fix permissions (no chown!) — so host user remains owner
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data /var/www
# Run PHP FPM
exec php-fpm
