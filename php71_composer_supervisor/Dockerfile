FROM registry.cn-hangzhou.aliyuncs.com/xwjs/php71

MAINTAINER xwj

# 安装composer
RUN mkdir -p /usr/local/composer &&\
    curl -sS https://getcomposer.org/installer | /usr/local/php/bin/php -- --install-dir="/usr/local/composer" &&\
    ln -s /usr/local/composer/composer.phar /usr/local/bin/composer

# 安装supervisor
RUN yum install python-setuptools-devel -y &&\
	easy_install supervisor &&\
	echo_supervisord_conf > /etc/supervisord.conf &&\
	mkdir -p  /etc/supervisord.ini &&\
	echo '[include]' >> /etc/supervisord.conf &&\
	echo 'files = /etc/supervisord.ini/*.ini' >> /etc/supervisord.conf &&\
	cd /tmp &&\
	wget https://github.com/xuweijie4030/docker-file/archive/master.zip &&\
	unzip master.zip &&\
	mv /tmp/docker-file-master/etc/supervisor/supervisord.ini/php-fpm.ini /etc/supervisord.ini

#开放端口
EXPOSE 9000

#执行命令
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]


