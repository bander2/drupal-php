FROM php:5.6-fpm

RUN apt-get update && apt-get install -y \
    php5-mysql \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
  && docker-php-ext-install mysql mysqli pdo pdo_mysql opcache \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd

COPY config/php.ini /usr/local/etc/php/
