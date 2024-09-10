use sakila;

desc customer;

show index from customer;

#USE INDEX 子句放在 FROM 子句之后。
#如果 MySQL 查询优化器要使用索引，则必须使用索引列表 index_list 中的一个索引

#创建索引
create index idx_last_name_first_name on customer(last_name,first_name);

#通过 EXPLAIN 语句查看以下查找姓氏为 BARBEE 的语句的执行计划
#从输出可以发现， MySQL 查询优化器选择使用 idx_last_name 索引
explain select * from customer where last_name = 'BARBEE';

#如果您认为使用 idx_last_name_first_name 更好，则使用 USE INDEX 指定它
explain select * from customer use index(idx_last_name_first_name) where last_name = 'BARBEE';

#USE INDEX 告诉 MySQL 用列表中的其中一个索引去做本次查询，但是 MySQL 不一定会用
#FORCE INDEX 强制 MySQL 使用一个特定的索引