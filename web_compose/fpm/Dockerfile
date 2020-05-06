FROM php:7.2.30-fpm
# WORKDIR /var/www/html
# 拷贝资源
COPY ./source/apt-sources.list /etc/apt/sources.list
COPY ./source/composer.phar /usr/local/bin/composer
COPY ./source/redis-5.0.0.tgz /tmp/redis-5.0.0.tgz
RUN apt-get update
# # 常用软件
RUN apt-get install -y zip unzip libpng-dev
# # 常用php拓展
RUN pecl install /tmp/redis-5.0.0.tgz \
&& docker-php-ext-enable redis \
&& docker-php-ext-install gd \
&& docker-php-ext-install zip \
&& docker-php-ext-install bcmath \
&& docker-php-ext-install pcntl \
&& docker-php-ext-install pdo_mysql \
&& docker-php-ext-install mysqli \
&& docker-php-ext-install sockets 

