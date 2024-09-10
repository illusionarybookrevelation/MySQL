use sakila;

#MySQL 复合索引允许您最多使用 16 个列
#定义多列索引时，应将 WHERE 子句中常用的列放在索引列列表的开头，将不常用的列放在索引列列表的后面。否则， MySQL 优化器可能不会使用索引

desc customer;

show indexes from customer;

#在 customer 表中已经存在几个索引，为了演示多列索引，我们先删掉 idx_last_name 索引
drop index idx_last_name on customer;
drop index idx_last_name_first_name on customer;

#使用下面的语句在 last_name 和 first_name 列上创建索引
create index idx_last_name_first_name on customer(last_name,first_name);

explain select * from customer where last_name = 'A' and first_name = 'B';

#当 SELECT 语句的 WHERE 条件中只有 last_name 时， MySQL 优化器选择使用索引。这是因为 last_name 列是索引中的第一列
explain select * from customer where last_name = 'A';

#当 SELECT 语句的 WHERE 条件中只有 first_name 时， MySQL 优化器选择不使用索引。 这是因为 first_name 列不是索引的第一列
explain select * from customer where first_name = 'B';


