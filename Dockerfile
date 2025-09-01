# Use official Drupal with Apache
FROM drupal:11-apache

# Install extra PHP extensions (optional but useful for Drupal)
RUN apt-get update && apt-get install -y \
    git unzip vim libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Enable Apache rewrite (needed for Drupal clean URLs)
RUN a2enmod rewrite

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html
