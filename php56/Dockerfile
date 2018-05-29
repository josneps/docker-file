FROM registry.cn-hangzhou.aliyuncs.com/xwjs/centos7

MAINTAINER xwj

# Yum
RUN yum -y update &&\
    yum install -y epel-release &&\
    yum install -y libtool vixie-cron  zlib  file openssl-devel sharutils zip  bash cyrus-sasl-devel libmemcached libmemcached-devel libyaml libyaml-devel unzip libvpx-devel ImageMagick-devel  libxml2-devel gd-devel mcrypt mhash libmcrypt libmcrypt-devel libxml2 libxml2-devel bzip2 bzip2-devel curl curl-devel libjpeg libjpeg-devel libpng libpng-devel freetype-devel libtool-ltdl-devel net-tools &&\
    yum clean all

# 安装PHP
RUN cd /tmp &&\
    wget http://cn2.php.net/distributions/php-5.6.36.tar.gz && \
    tar xzf php-5.6.36.tar.gz &&\
    cd /tmp/php-5.6.36 &&\
    ./configure --prefix=/usr/local/php --with-mysqli --with-pdo-mysql --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir --enable-simplexml --enable-xml --disable-rpath --enable-bcmath --enable-soap --enable-zip --with-curl --enable-fpm --with-fpm-user=nobody --with-fpm-group=nobody --enable-mbstring --enable-sockets --with-mcrypt --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-opcache && \
    make && \
    make install &&\
    cp /usr/local/php/bin/php /usr/bin &&\
    cp /tmp/php-5.6.36/php.ini-production /usr/local/php/lib/php.ini && \
    cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf && \
    mkdir -p /var/www/html &&\
    chmod -R 775 /var/www/html

# 安装redis + mongodb扩展
RUN /usr/local/php/bin/pecl install redis &&\
    echo 'extension=redis.so;' >> /usr/local/php/lib/php.ini &&\
    /usr/local/php/bin/pecl install mongodb &&\
    echo 'extension=mongodb.so;' >> /usr/local/php/lib/php.ini



# 开放端口
EXPOSE 9000

# 执行命令
ENTRYPOINT ["/usr/local/php/sbin/php-fpm", "-F", "-c", "/usr/local/php/lib/php.ini"]
