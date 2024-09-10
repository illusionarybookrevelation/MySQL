#查询当前mysql用户列表,下面提示报错不用管它,运行就完了
select user from mysql.user;

#在 CREATE USER 关键字后指定帐户名称。帐户名称由两部分组成： username 和 hostname ，以 @ 符号分隔
#username 是用户的名称。而 hostname 从用户连接到 MySQL 服务器的主机名
#hostname 帐户名称的部分是可选的。如果省略它，用户可以从任何主机连接
#如果 username 和 hostname 中包含空格或 - 等特殊字符，则需要将用户名和主机名分别按单引号 (')，反引号 (``) 或双引号 (")引用
#在 IDENTIFIED BY 关键字后指定用户的密码
#IF NOT EXISTS 选项仅在新用户不存在时有条件地创建新用户
#CREATE USER 语句创建了一个没有任何权限的新用户。要向用户授予权限，请使用 GRANT 语句

#创建一个名为 sqliz 的新用户
create user 'sqliz'@'%' identified by 'sql1234';

#创建一个新数据库，名为 sqlizdb
create database sqlizdb;

#使用 GRANT 语句将数据库 sqlizdb 的所有权限授权给用户 sqliz
grant all privileges on sqlizdb.* to sqliz@'%';