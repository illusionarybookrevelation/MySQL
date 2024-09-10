use sakila;
show indexes from film;

#PRIMARY 索引列因为是主键，索引基数的数量核行数是相同的
#idx_title 索引的基数也是 1000
#idx_fk_language_id 索引的基数为 1，因为 film 表中只有 language_id 为 1 的影片
#MySQL 查询优化器不会使用 idx_fk_language_id 索引，因为它的基数太小了
explain select * from film where language_id = 1;

#MySQL SHOW INDEXES 语句返回的 Cardinality 列中值是索引基数。索引基数是 MySQL 查询优化器决定是否使用索引的一个重要依据