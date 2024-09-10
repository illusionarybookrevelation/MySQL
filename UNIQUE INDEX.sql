use testdb;

#创建租户表
create table if not exists tenant(
    id int auto_increment primary key,
    name varchar(50) not null,
    email varchar(50) not null
);

#在租户表的 email 列创建唯一索引
create unique index idx_tenant_email on tenant(email);

show indexes from tenant;

#创建租户用户表
create table if not exists tenant_user(
    id int auto_increment primary key,
    tenant_id int not null,
    username varchar(50) not null,
    nickname varchar(50) not null
);

#在租户用户表的 tenant_id 列和 username 列上创建唯一索引
create unique index idx_tenant_username on tenant_user(tenant_id,username);

show index from tenant_user;

#验证 tenant 表上的唯一索引。
insert into tenant(name,email) values('A','a@a.com'),('B','b@b.com');

select * from tenant;
#错误结果
insert into tenant(name,email) values('A','a@a.com');

#验证 tenant_user 表上的唯一复合索引
#为 A 租户添加两个用户名分别为 a 和 b 的用户
insert into tenant_user(tenant_id,username,nickname) values(1,'a','A user'),(1,'b','A user2');

select * from tenant_user;

update tenant_user set nickname = 'A user1' where username = 'a';

#为 B 租户添加一个用户名为 a 的用户,虽然这个用户的用户名已经存在，但是由于 tenant_id 列的值不同，因此可以正常插入
insert into tenant_user(tenant_id,username,nickname) values(2,'a','B user1');

#我们再尝试为 B 租户添加一个用户名为 a 的用户,MySQL 会返回一个错误
insert into tenant_user(tenant_id,username,nickname) values(2,'a','B user2');