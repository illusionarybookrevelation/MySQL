use testdb;
drop table if exists user_hobby;
create table user_hobby (
    hobby_id int not null auto_increment,
    user_id int not null,
    hobby varchar(45) not null,
    primary key (hobby_id),
    constraint unique_user_hobby unique(user_id,hobby)
);

insert into user_hobby(user_id,hobby) values(1,'Football'),(2,'Swimming');

select * from user_hobby;

#唯一键约束 unique_user_hobby 避免了插入重复的数据
insert into user_hobby(user_id,hobby) values(1,'Football');

show index from user_hobby;

#删除唯一约束键
drop index unique_user_hobby on user_hobby;


#唯一键允许其中的列接受 NULL 值。但是，NULL 值会破坏唯一键约束。也就是唯一键对 NULL 值无效
drop table if exists user_hobby;
#修改一下刚刚的建表语句，其中允许 hobby 列为 NULL
create table user_hobby (
    hobby_id int not null auto_increment,
    user_id int not null,
    hobby varchar(45),
    primary key (hobby_id),
    constraint unique_user_hobby unique(user_id,hobby)
);

insert into user_hobby(user_id,hobby) values (1,NULL),(1,NULL);

#唯一键的两列出现了重复的数据。NULL 让唯一键失效了
select * from user_hobby;