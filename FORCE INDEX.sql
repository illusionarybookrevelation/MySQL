use sakila;
desc film;

show indexes from film;

#查找语言为英语的影片
select * from film where language_id = 1;

#查看该语句的执行计划，请使用 EXPLAIN 语句
explain select * from film where languagE_id = 1;

# MySQL 查询优化器并没有使用 idx_fk_language_id 索引。这是因为 film 表中的所有影片都是英文影片，因此 MySQL 查询优化器指定全表扫描
#要强制查询优化器使用 idx_fk_language_id 索引，请使用以下带有 FORCE INDEX 的查询
explain select * from film force index(idx_fk_language_id) where language_id = 1;