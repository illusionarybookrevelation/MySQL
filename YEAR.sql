use testdb;

create table test_year(
    id int auto_increment primary key,
    create_year year not null
);

insert into test_year(create_year) values(2022);

insert into test_year(create_year) values(10),(98);

insert into test_year(create_year) values(0),('0');

select * from test_year;