use testdb;

drop table if exists user;

create table user (
    id int not null auto_increment,
    name varchar(255) not null,
    age int not null default 20,
    email varchar(255) not null,
    phone varchar(255) not null,
    primary key (id)
);

desc user;

insert into user (name,age,email,phone) values ('Tim',20,'tim@sqliz.com','8769232');

select * from user;

alter table user drop column age;

alter table user drop column email,drop column phone;