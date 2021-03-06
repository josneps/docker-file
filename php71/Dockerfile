FROM registry.cn-hangzhou.aliyuncs.com/xwjs/centos7

MAINTAINER xwj

# Yum
RUN yum -y update &&\
    yum install -y epel-release &&\
    yum install -y libtool vixie-cron zlib file openssl-devel sharutils zip  bash cyrus-sasl-devel libmemcached libmemcached-devel libyaml libyaml-devel unzip libvpx-devel ImageMagick-devel  gd-devel mcrypt mhash libmcrypt libmcrypt-devel libxml2 libxml2-devel bzip2 bzip2-devel curl curl-devel libjpeg libjpeg-devel libpng libpng-devel freetype-devel libtool-ltdl-devel net-tools glibc-headers gcc-c++ postgresql-devel &&\
    yum clean all

# 安装PHP
ENV PHP_VERSION 7.1.16

RUN cd /tmp &&\
    wget http://cn2.php.net/distributions/php-$PHP_VERSION.tar.gz &&\
    tar -xvf php-$PHP_VERSION.tar.gz &&\
    cd ./php-$PHP_VERSION &&\
    ./configure \
        --prefix=/usr/local/php \
        --with-mysqli \
        --with-pdo-mysql \
        --with-iconv-dir \
        --with-freetype-dir \
        --with-jpeg-dir \
        --with-png-dir \
        --with-zlib \
        --with-libxml-dir \
        --enable-simplexml \
        --enable-xml \
        --disable-rpath \
        --enable-bcmath \
        --enable-soap \
        --enable-zip \
        --with-curl \
        --enable-fpm \
        --with-fpm-user=nobody \
        --with-fpm-group=nobody \
        --enable-mbstring \
        --enable-sockets \
        --with-mcrypt \
        --with-gd \
        --enable-gd-native-ttf \
        --with-openssl \
        --with-mhash \
        --enable-opcache && \
    make && \
    make install &&\
    cp /tmp/php-$PHP_VERSION/php.ini-production /usr/local/php/lib/php.ini && \
    cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf && \
    cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf &&\
    rm -rf php-$PHP_VERSION.tar.gz

# 设置环境变量
ENV PATH /usr/local/php/bin:$PATH
ENV PATH /usr/local/php/sbin:$PATH

# 安装扩展redis、mongodb、swoole
RUN pear config-set php_ini /usr/local/php/lib/php.ini &&\
    pecl config-set php_ini /usr/local/php/lib/php.ini &&\
    pecl install swoole &&\
    pecl install redis &&\
    pecl install mongodb
    

# 安装composer
RUN mkdir -p /usr/local/composer &&\
    curl -sS https://getcomposer.org/installer | /usr/local/php/bin/php -- --install-dir="/usr/local/composer" &&\
    ln -s /usr/local/composer/composer.phar /usr/local/bin/composer

# 安装supervisor
RUN yum install python-setuptools-devel -y &&\
    easy_install supervisor &&\
    echo_supervisord_conf > /etc/supervisord.conf &&\
    mkdir -p  /etc/supervisord.ini
COPY ["./supervisord_etc/supervisord.conf", "/etc/"]
COPY ["./supervisord_etc/supervisord.ini/php-fpm.ini", "/etc/supervisord.ini/"]

# 开放端口
EXPOSE 9000

# 执行命令
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
