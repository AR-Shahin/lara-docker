#!/bin/bash

# Wait for MySQL and Redis to be up (optional for first-time setup)
sleep 10

# Install dependencies
composer install --no-interaction --prefer-dist --optimize-autoloader

# Setup Laravel
php artisan key:generate
php artisan migrate --force
php artisan config:cache
php artisan route:cache
php artisan view:cache

exec "$@"
