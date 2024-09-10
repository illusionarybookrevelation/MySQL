use sakila;

select * from sakila.actor where first_name = 'NICK';

#使用 EXPLAIN 来查看以上 SELECT 语句的语句的执行计划，以了解 MySQL 在内部如何执行此查询
explain select * from sakila.actor where first_name = 'NICK';

create index first_name on actor(first_name);

show indexes from actor;

explain select * from sakila.actor where first_name = 'NICK';
