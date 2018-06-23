FROM registry.cn-hangzhou.aliyuncs.com/xwjs/centos7

MAINTAINER xwj

# Redis

ENV REDIS_VERSION 3.2.1

RUN cd /tmp &&\
    wget http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz &&\
    tar -zvxf redis-$REDIS_VERSION.tar.gz &&\
    cd /tmp/redis-$REDIS_VERSION &&\
    make PREFIX=/usr/local/redis install &&\
    mkdir /data

COPY ["./redis.conf", "/usr/local/redis/"]

# 开放端口
EXPOSE 6379

# 执行命令
ENTRYPOINT ["/usr/local/redis/bin/redis-server", "/usr/local/redis/redis.conf"] 
