FROM centos:centos7
#解压软件包
ADD ./packages/* /home/packages/
#安装必备软件包
RUN yum install -y wget make gcc gcc-c++ expat-devel zlib-devel libxml2-devel openssl openssl-devel libcurl-devel perl autoconf \
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
#新增Apache配置
&& sed -i '$aInclude conf/vhosts/*.conf' /usr/local/apache/conf/httpd.conf \
#设置ApacheApxs执行脚本
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
&& make && make install \
#清除软件包
&& rm -rf /home/packages \
#添加项目目录
&& mkdir -p /home/www \
#添加环境变量
&& sed -i '$aexport PATH=$PATH:/usr/local/apache/bin:/usr/local/php/bin' /etc/bashrc \
&& source ~/.bashrc
COPY ./vhosts /usr/local/apache/conf/vhosts
COPY ./phpetc/php.ini /usr/local/php/etc
#绑定匿名卷,防止删除容器导致数据丢失 
#PS:删除容器不会清除匿名卷,如有需要可使用[docker rm -v ID]同时删除匿名卷,或[docker volume prune]清除未在使用的匿名卷
VOLUME ["/usr/local/apache/logs", "/usr/local/apache/conf/vhosts", "/usr/local/php/etc", "/usr/local/php/var", "/home/www"]
EXPOSE 80
CMD ["/usr/local/apache/bin/httpd", "-DFOREGROUND"]
