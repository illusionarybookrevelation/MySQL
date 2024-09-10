use testdb;
drop table if exists user_hobby;
create table user_hobby(
    hobby_id int auto_increment primary key,
    user_id int not null,
    hobby varchar(45) not null
);

insert into user_hobby(user_id,hobby) values(1,'Football'),(2,'Swimming');

select * from user_hobby;

#如果插入NULL则会报错
insert into user_hobby(user_id,hobby) values(1,NULL);

#将表中hobby属性修改为NULL
alter table user_hobby modify hobby varchar(45) null;

#但是这种方法不能直接将已经是NULL属性的hobby改成NOT NULL，会报错，这是因为 hobby 列中的 NULL 值阻止了这个操作
alter table user_hobby modify hobby varchar(45) not null;

#正确做法是将hobby列中NULL值改为NOT NULL值，然后再修改hobby的定义
update user_hobby set hobby = 'NOTHING' where hobby is null;
alter table user_hobby modify hobby varchar(45) not null;