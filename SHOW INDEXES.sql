use sakila;
show indexes from sakila.film;

#可以使用 WHERE 子句对 SHOW INDEXES 的结果进行过滤。 比如，如果您想要从 film 表中获取所有的唯一索引
show indexes from sakila.film where Non_unique = 0;