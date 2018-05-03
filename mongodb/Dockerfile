FROM registry.cn-hangzhou.aliyuncs.com/xwjs/centos7

MAINTAINER xwj

# MongoDB
RUN cd /tmp &&\
    wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-3.6.4.tgz &&\
    tar -zvxf mongodb-linux-x86_64-rhel70-3.6.4.tgz &&\
    mv mongodb-linux-x86_64-rhel70-3.6.4 /usr/local/mongodb &&\
    mkdir -p /data/db &&\
    mkdir /usr/local/mongodb/log &&\
    touch /usr/local/mongodb/log/mongodb.log &&\
    ln -s /usr/local/mongodb/bin/mongod /usr/bin/mongod &&\
    ln -s /usr/local/mongodb/bin/mongo /usr/bin/mongo

# 开放端口
EXPOSE 27017

# 执行命令
ENTRYPOINT ["mongod", "--logpath=/usr/local/mongodb/log/mongodb.log", "--directoryperdb"] 
