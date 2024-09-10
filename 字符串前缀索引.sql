use sakila;

desc actor;

#如果列为 CHAR， VARCHAR 和 TEXT 等非二进制字符类型， length 指定用于前缀索引的字符数
#如果列为 BINARY， VARBINARY 和 BLOB 等二进制字符类型， length 指定用于前缀索引的字节数
#为字符串列的指定长度的前缀创建前缀索引
#相比于为整个字符串列创建索引，前缀索引能减少磁盘的使用量，并提高索引的写入速度

show indexes from actor;

#查询查找 first name 以字符串 GE 开头的演员
select * from actor where first_name like 'GE%';

#该 first_name 列没有索引 ，查询优化器必须扫描所有行以返回结果
explain select * from actor where first_name like 'GE%';

#按照前缀创建一个索引
create index idx_first_name_prefix_2 on actor(first_name(2));

#确定前缀长度时， 应该尽量让字符串前缀保持唯一性。 唯一性越强，则索引的效率越高