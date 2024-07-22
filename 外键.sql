create database if not exists testdb;

use testdb;
create table user (
     user_id int not null auto_increment,
     name varchar(45) not null,
    primary key(user_id)
);
insert into user (user_id,name) values(1,'Tim'),(2,'Lucy');


#CASCADE 策略
/*如果外键的 ON DELETE 和 ON UPDATE 使用了 CASCADE 策略：
           当父表的行被删除的时候，子表中匹配的行也会被删除。
           当父表的行的键值更新的时候，子表中匹配的行的字段也会被更新。*/
drop table if exists user_hobby;
create table user_hobby (
    hobby_id int not null auto_increment,
    user_id int not null,
    hobby varchar(45) not null,
    primary key(hobby_id),
    constraint fk_user
                        foreign key(user_id)
                        references user (user_id)
                        on delete cascade
                        on update cascade
);

delete from user;
delete from user_hobby;
insert into user(user_id,name) values(1,'Tim');
insert into user_hobby(hobby_id,user_id,hobby) values(1,1,'Football'),(2,1,'Swimming');

update user set user_id = 100 where user_id = 1;

select * from user_hobby;

delete from user where user_id = 100;


#RESTRICT 策略
/*如果外键的 ON DELETE 和 ON UPDATE 使用了 RESTRICT 策略：
                    MySQL 禁止删除父表中与子表匹配的行。
                    MySQL 禁止删除父表中与子表匹配的行的键的值。*/
drop table if exists user_hobby;
create table user_hobby(
    hobby_id int not null auto_increment,
    user_id int not null,
    hobby varchar(45) not null,
    primary key(hobby_id),
    constraint fk_user
                      foreign key(user_id)
                      references user(user_id)
                      on delete restrict
                      on update restrict
) ;
delete from user;
delete from user_hobby;
insert into user (user_id,name) values(1,'Tim');
insert into user_hobby(hobby_id,user_id,hobby) values(1,1,'Football'),(2,1,'Swimming');

update user set user_id = 100 where user_id = 1;
delete from user where user_id = 1;


#SET NULL 策略
/*如果外键的 ON DELETE 和 ON UPDATE 使用了 SET NULL 策略：
        当父表的行被删除的时候，子表中匹配的行的列的值被设置为 NULL。
        当父表的行的键值被更新的时候，子表中匹配的行的列的值被设置为 NULL。*/
drop table if exists user_hobby;
create table user_hobby(
    hobby_id int not null auto_increment,
    user_id int,
    hobby varchar(45) not null,
    primary key(hobby_id),
    constraint fk_user
                       foreign key(user_id)
                       references user(user_id)
                       on delete set null
                       on update set null
);
delete from user;
delete from user_hobby;
insert into user(user_id,name) values(1,'Tim');
insert into user_hobby(hobby_id,user_id,hobby) values(1,1,'Football'),(2,1,'Swimming');

update user set user_id = 100 where user_id = 1;
delete from user where user_id = 1;


#自引用外键
/*有时，子表和父表可能是同一个表。这种表中的外键被称为自引用外键。
通常，自引用外键定义在表示树形数据结构的表中。比如一个代表分类的表:
在这个表中，parent_category_id 列是一个外键。它引用了 category 表的 category_id 列
这个表实现了一个无限层级的分类树。一个分类可以有多个子分类，一个子分类可以有 0 个或者 1 个父类*/
create table category(
    category_id int auto_increment primary key,
    category_name varchar(45),
    parent_category_id int,
    constraint fk_category foreign key (parent_category_id)
                     references category(category_id)
                     on delete restrict
                     on update cascade
);


#启用或禁用外键约束
/*禁用外键约束在批量导入数据的时候很有用*/
set foreign_key_checks = 0;
set foreign_key_checks = 1;