FROM centos:centos7
ADD ./packages/* /home/packages/
RUN yum install -y wget make gcc gcc-c++ expat-devel zlib-devel libxml2-devel openssl openssl-devel libcurl-devel perl \
&& cd /home/packages/apr-1.7.0 \
&& ./configure --prefix=/usr/local/apr \
&& make && make install \
&& cd /home/packages/apr-util-1.6.1 \
&& ./configure --prefix=/usr/local/apr-util --with-apr=/usr/local/apr/bin/apr-1-config \
&& make && make install \
&& cd /home/packages/pcre-8.43 \
&& ./configure --prefix=/usr/local/pcre \
&& make && make install \
&& cd /home/packages/httpd-2.4.43 \
&& ./configure \
--prefix=/usr/local/apache \
--with-apr=/usr/local/apr \
--with-apr-util=/usr/local/apr-util \
--with-pcre=/usr/local/pcre \
--enable-so \
--enable-deflate=shared \
--enable-expires=shared \
--enable-rewrite=shared \
--enable-static-support \
&& make && make install \
&& sed -i '1i\#!/usr/bin/perl -w' /usr/local/apache/bin/apxs \
&& cd /home/packages/php-7.2.29 \
&& ./configure \
--prefix=/usr/local/php \
--with-config-file-path=/usr/local/php/etc \
--with-apxs2=/usr/local/apache/bin/apxs \
--enable-fpm \
--enable-mysqlnd \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-openssl \
--enable-opcache \
--enable-bcmath \
--with-curl \
--with-libxml-dir \
--with-pcre-dir \
--enable-mbstring \
--with-xmlrpc \
--enable-zip \
--enable-sockets \
--enable-pcntl \
--enable-xml \
&& make && make install
EXPOSE 80
CMD ["/usr/local/apache/bin/httpd", "-DFOREGROUND"]
