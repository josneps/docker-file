FROM registry.cn-hangzhou.aliyuncs.com/xwjs/centos7

MAINTAINER feng

# Yum
RUN yum -y update &&\
    yum install -y pcre pcre-devel zlib openssl openssl-devel &&\
    yum clean all

# Nginx
RUN cd /tmp &&\
    wget http://nginx.org/download/nginx-1.13.10.tar.gz &&\
    tar xzf nginx-1.13.10.tar.gz &&\
    cd /tmp/nginx-1.13.10 &&\
    ./configure \
        --prefix=/usr/local/nginx \
        --with-http_ssl_module --with-http_sub_module --with-http_dav_module --with-http_flv_module \
        --with-http_gzip_static_module --with-http_stub_status_module --with-debug && \
        make && \
        make install &&\
        PATH=$PATH:/usr/local/nginx/sbin &&\
        export PATH &&\
        source /etc/profile

# 创建代码目录
RUN mkdir -p /var/www/html &&\
    chmod -R 775 /var/www/html

# 开放端口
EXPOSE 80 443

# 执行命令
ENTRYPOINT ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"] 
