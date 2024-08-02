use testdb;

drop table if exists user;

create table user (
    user_id int auto_increment,
    name varchar(255),
    primary key (user_id)
);

insert into user (name) values('Tim'),('Jim');

select * from user;

delete from user where user_id = 2;

insert into user (name) values ('Jim');

insert into user (user_id,name) values (20,'Tom');

insert into user (name) values ('Lucy');

show create table user;


