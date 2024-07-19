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

