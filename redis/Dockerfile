FROM registry.cn-hangzhou.aliyuncs.com/xwjs/centos7

MAINTAINER xwj

# Redis
RUN cd /tmp &&\
    wget http://download.redis.io/releases/redis-4.0.9.tar.gz &&\
    tar -zvxf redis-4.0.9.tar.gz &&\
    cd /tmp/redis-4.0.9 &&\
    make &&\
    make install &&\
    mkdir -p /usr/local/redis/bin &&\
    mkdir -p /usr/local/redis/etc &&\
    cp /tmp/redis-4.0.9/redis.conf /usr/local/redis/etc &&\
    cd /tmp/redis-4.0.9/src &&\
    cp mkreleasehdr.sh redis-trib.rb redis-server redis-sentinel redis-cli redis-check-rdb redis-check-aof redis-benchmark /usr/local/redis/bin/

# Ruby && redis-dump
RUN cd /tmp &&\
    mkdir rvm &&\
    cd rvm &&\
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 &&\
    curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer &&\
    curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc &&\
    gpg --verify rvm-installer.asc &&\
    bash rvm-installer stable &&\
    /usr/local/rvm/bin/rvm install ruby 2.4.1 &&\
    gem sources --remove https://rubygems.org/ &&\
    gem sources -a https://ruby.taobao.org/ &&\
    gem install redis-dump -V

# 开放端口
EXPOSE 6379

# 执行命令
ENTRYPOINT ["/usr/local/redis/bin/redis-server /usr/local/redis/etc/redis.conf"] 
