use testdb;
drop table if exists user;
create table user(
    id int auto_increment primary key,
    name varchar(45) not null,
    login_name varchar(45) not null check(length(login_name) >= 4),
    password varchar(45) not null check(length(password) >= 8),
    constraint check(login_name <> password)
);

/*三条约束：
  在 login_name 列定义中的 CHECK(length(login_name) >= 4) 保证登录名的长度不小于 4
  在 password 列定义中的 CHECK(length(password) >= 8) 保证登录名的长度不小于 8
  在表上的约束 CONSTRAINT CHECK(login_name <> password) 保证密码不能和登录名相同
*/

show create table user;

#测试约束是否生效,一个报错是登录名长度不符合，另一个是密码长度不符合
insert into user(name,login_name,password) values('Tim','tim','timisok');
insert into user(name,login_name,password) values('Tim','tim1','timisok');

#验证密码不能和登录名相同的 CHECK 约束是否生效
insert into user(name,login_name,password) values('Tim','timisgood','timisgood');

#正确插入数值
insert into user(name,login_name,password) values('Tim','hitim','timisgood');