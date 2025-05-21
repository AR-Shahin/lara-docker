#!/bin/bash

# This script clears various Laravel caches inside the Docker container

echo "Clearing Laravel caches..."

# Clear the application cache
echo "Clearing application cache..."
docker exec laravel-app php artisan cache:clear

# Clear the configuration cache
echo "Clearing configuration cache..."
docker exec laravel-app php artisan config:clear

# Clear the route cache
echo "Clearing route cache..."
docker exec laravel-app php artisan route:clear

# Clear the view cache
echo "Clearing view cache..."
docker exec laravel-app php artisan view:clear

# Clear the compiled classes
echo "Clearing compiled classes..."
docker exec laravel-app php artisan clear-compiled

echo "All caches cleared successfully!"

