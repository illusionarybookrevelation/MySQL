use testdb;

create table orders(
    id int primary key auto_increment,
    title varchar(255) not null,
    state enum('Unpaid','Paid','Shipped','Completed') not null
);

#将插入数据到 ENUM 列中，请使用预定义列表中的枚举值
insert into orders(title,state) values('Apples','Paid');

#使用枚举成员的数字索引将数据插入到 ENUM 列中
insert into orders(title,state) values('Bananas',2);

insert into orders(title,state) values('Pears','Shipped'),('Peaches','Completed');

#定义了 state 一个 NOT NULL 列，当你插入一个新行而不指定state 列的值时，MySQL 将使用第一个枚举成员作为默认值
insert into orders(title) values('Oranges');

select * from orders;

select * from orders where state = 'Paid';
select * from orders where state = 2;

#根据索引号对 ENUM 值进行排序。因此，枚举成员的顺序取决于它们在枚举列表中的定义方式。
select * from orders order by state;