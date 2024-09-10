use testdb;

#隐藏索引是实际存在的，但是对 MySQL 查询优化器不可见的索引。即使使用 FORCE INDEX，优化器也不会使用隐藏索引
#在删除一个索引前，您可以先将索引隐藏。如果这不影响性能，您再去真正的删除索引
#隐藏索引对 MySQL 查询优化器是不可见的，但是它是真实存在的，并且对写入操作保持最新

desc orders;
select * from orders;

create index idx_abcd on orders(state);

show indexes from orders;

#MySQL 允许您使用 VISIBLE 和 INVISIBLE 标识索引是否可见
create index idx_t on orders(title) invisible;

#要更改现有索引的可见性，请按照如下语法使用 ALTER TABLE 语句
alter table orders alter index idx_abcd invisible;

#MySQL 查询优化器默认不使用隐藏索引，但是您可以通过系统变量 optimizer_switch 中的 use_invisible_indexes 修改这一行为
select @@optimizer_switch;

#要在当前会话中修改默认的行为，请使用如下语句
set session optimizer_switch="use_invisible_indexes=on";

