use testdb;
#获取当前的 MySQL 服务器支持的字符集和默认的排序规则
show character set;
#从 MySQL 8 开始，MySQL 默认的字符集为 utf8mb4，而早期版本的 MySQL 的默认字符集是 latin1
#latin1 字符集只能表示单字节字符，而 utf8mb4 字符集可以表示多字节字符包括表情符合

#服务器级字符集和排序规则是所有的数据库的默认的字符集和排序规则，若数据库不是指定，则采用服务器级的设置
show variables like "character_set_server";

#查看服务器级的排序规则
show variables like "collation_server";

#数据库级的字符集和排序规则只对当前数据库生效，这也是数据库中的表的默认的字符集和排序规则
select @@character_set_database,@@collation_database;

#查看指定数据库的字符集和排序规则
show create database testdb;