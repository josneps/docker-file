FROM registry.cn-hangzhou.aliyuncs.com/xwjs/php71

MAINTAINER xwj

#Xdebug
RUN cd /tmp &&\
    wget https://xdebug.org/files/xdebug-2.7.0alpha1.tgz &&\
    tar vxzf xdebug-2.7.0alpha1.tgz &&\
    cd xdebug-2.7.0alpha1 &&\
    /usr/local/php/bin/phpize &&\
    ./configure --with-php-config=/usr/local/php/bin/php-config --enable-xdebug&&\
    make &&\
    make install &&\
    echo '[Xdebug]' >> /usr/local/php/lib/php.ini &&\
    echo 'extension=xdebug.so;' >> /usr/local/php/lib/php.ini

#开放端口
EXPOSE 9000

#执行命令
ENTRYPOINT ["/usr/local/php/sbin/php-fpm", "-F", "-c", "/usr/local/php/lib/php.ini"]
