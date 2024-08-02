use testdb;
# alter table user_hobby drop foreign key fk_user;
drop table if exists user;
create table user (
    id int auto_increment primary key,
    name varchar(255) not null
);

desc user;

alter table user add column age int not null default 20;

select * from user;

alter table user add column email varchar(255) not null, add column phone varchar(255) not null;

alter table user add column address varchar(255) not null first;

alter table user drop column address;

alter table user add column address varchar(255) not null after email;

insert into user (id,name,age,email,address,phone) values (1,'Tim',18,'123456789@qq.com','美国旧金山','1008611');