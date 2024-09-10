use testdb;
create table test_lock(
    id int not null auto_increment,
    txt varchar(255) not null,
    primary key (id)
);

#查看当前会话的 ID
show processlist;

#在当前会话没有获取 READ 锁的情况下向表中插入一个新行,可以正常插入
insert into test_lock(txt) values('Hello');

#使用下面的 LOCK TABLES 获取 test_lock 表的读锁
lock tables test_lock read;

#在拥有 READ 锁的情况下向表中插入一个新行,此时会报错
insert into test_lock(txt) values('Hello World');

#可以重新打开一个会话，并在新会话测试读表,这说明，拥有表的读锁的会话之外的其他会话也可以读表
select * from test_lock;

#新的会话中测试写表,请执行上面的的INSERT语句,你会发现，该操作将被挂起，直到表的读锁被释放

#可以使用 SHOW PROCESSLIST 语句查看回话是否处于等待的状态

#WRITE 锁是排他锁，只有持有锁的会话才能访问表，其他会话的对表的操作都会等待锁的释放
lock tables test_lock write;

insert into test_lock(txt) values('Hi');

#开启一个新的会话尝试读取数据，操作处于等待的状体，并且没有返回
select * from test_lock;

#使用下面的语句释放掉持有的锁,将看到第二个会话中的 SELECT 语句的执行结果
unlock tables;
