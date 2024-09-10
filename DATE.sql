use testdb;
create table test_date(
    id int auto_increment primary key,
    created_date date not null
);

insert into test_date(created_date) values('2008-08-08');

select * from test_date;

/*使用两位数的年份值，MySQL 仍然按照以下规则将它转为四位数的年份值：
  00-69 范围内的年份值将转换为 2000-2069
  70-99 范围内的年份值将转换为 1970-1999
*/
insert into test_date(created_date) values('09-09-09'),('99-09-09');

#NOW() 函数用来获取当前日期和时间
select now() '现在';

#CURDATE() 用来获取获取当前系统日期
select curdate() '系统';

#DATE() 函数用来返回一个日期或者日期时间值的日期部分
select date(now()) '日期';

#要格式化日期值，请使用 DATE_FORMAT() 函数。以下语句使用日期格式模式 %m/%d/%Y 格式化当前日期
select date_format(curdate(),'%m/%d/%Y') today;

#计算两个日期值之间的天数,如果第一个参数早于第二个参数返回为负数，否则返回为正数或者 0
select datediff('2021-01-01','2022-01-01') days;

#DATE_ADD() 函数用于将天数、周数、月数、年数等添加到给定的日期值
select curdate() '今天',
       date_add(curdate(),interval 1 day) '一天后',
       date_add(curdate(),interval 1 week) '一周后',
       date_add(curdate(),interval 1 month) '一个月后',
       date_add(curdate(),interval 1 year) '一年后';

#同样，DATE_SUB() 被用于从日期中减去一个时间间隔
select curdate() '今天',
       date_sub(curdate(),interval 1 day) '一天前',
       date_sub(curdate(),interval 1 week) '一周前',
       date_sub(curdate(),interval 1 month) '一个月前',
       date_sub(curdate(),interval 1 year) '一年前';

#如果你想获得的日，月，季度和日期值的年份，您可以使用相应 DAY()， MONTH()， QUARTER()，和 YEAR() 函数
select day(curdate()) 'day',
       month(curdate()) 'month',
       quarter(curdate()) 'quarter',
       year(curdate()) 'year';

#WEEK 函数返回周数， WEEKDAY 函数返回工作日索引， WEEKOFYEAR 函数返回日历周
select weekday(curdate()) 'weekday',
       week(curdate()) 'week',
       weekofyear(curdate()) 'weekofyearr';