use testdb;

create table order_item (
    order_item_id int auto_increment primary key,
    goods varchar(45) not null,
    price decimal not null,
    quantity int not null
);

insert into order_item (goods,price,quantity) values ('Apple',5,3),('Peach',4,4);

select * from order_item;

select goods,price,quantity,(price * quantity) as total_amount from order_item;

alter table order_item add column total_amount decimal generated always as (price * quantity) stored;

desc order_item;

update order_item set price = 3 where order_item_id = 1;

alter table order_item add column vir_total_amount decimal generated always as (price * quantity) virtual;