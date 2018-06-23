use mysql;

select host, user from user;

-- 新建root用户
create user root identified by '1';

-- 为root用户设置权限及密码
grant all on *.* to 'root'@'%' identified by '1' with grant option;

flush privileges;