# Build args
ARG PHP_VERSION

# Get the image version from the build args
FROM php:${PHP_VERSION}-apache

# Install dependencies
RUN apt update && apt install -y libpng-dev libonig-dev libxml2-dev zip unzip && rm -rf /var/lib/apt/lists/*

# Enable apache modules
RUN a2enmod rewrite

# Install php extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
RUN docker-php-ext-enable pdo_mysql

# Use pecl to get Redis extension ready
RUN pecl install redis \
  # Redis is installed, enable it
  && docker-php-ext-enable redis

# Add the vhost file
ADD ./sites-available/000-default.conf /etc/apache2/sites-available/

# Set the working directory
WORKDIR /var/www/html
