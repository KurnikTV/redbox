FROM php:8.2-fpm-alpine

# Установка зависимостей
RUN apk update && apk add --no-cache \
    postgresql-dev \
    curl \
    git \
    unzip

# Установка расширений
RUN docker-php-ext-install pdo pdo_pgsql

RUN apk add --no-cache pcre-dev $PHPIZE_DEPS && \
    pecl install redis && \
    docker-php-ext-enable redis

# Установка Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Рабочая директория
WORKDIR /var/www

# Копируем только composer файлы
COPY composer.* ./

# Устанавливаем зависимости
RUN composer install --ignore-platform-reqs

# Копируем исходный код
COPY src/ /var/www/html/
