FROM php:7.2.30-fpm
# WORKDIR /var/www/html
# 常用软件
RUN apt-get update
RUN apt-get install -y zip \
unzip \
libpng-dev
# 常用php拓展
RUN docker-php-ext-install bcmath \
&& docker-php-ext-install pcntl \
&& docker-php-ext-install pdo_mysql \
&& docker-php-ext-install zip \
&& docker-php-ext-install mysqli \
&& docker-php-ext-install sockets\
&& docker-php-ext-install gd \
&& pecl install http://pecl.php.net/get/redis-5.0.0.tgz \
&& docker-php-ext-enable redis
# 安装composer
RUN curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer
