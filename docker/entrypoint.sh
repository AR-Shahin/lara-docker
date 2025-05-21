#!/bin/bash

cd /var/www

composer install --no-interaction --prefer-dist

cp .env.example .env

php artisan key:generate
php artisan config:clear
php artisan config:cache
php artisan route:cache
php artisan view:cache

chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

exec php-fpm
