use testdb;

set time_zone = '+00:00';

create table timestamp_n_datetime(
    id int auto_increment primary key,
    ts timestamp,
    dt datetime
);

insert into timestamp_n_datetime(ts,dt) values(NOW(),NOW());

select ts,dt from timestamp_n_datetime;

# TIMESTAMP 当我们更改时区时， TIMESTAMP 列以 UTC 存储日期和时间值，该列的值会根据新时区进行调整
set time_zone = '+8:00';

# NOW() 函数将变量 @dt 设置为当前日期和时间
set @dt = NOW();

select @dt;

# DATETIME 值中提取日期部分
select date(@dt);

create table test_datetime(
    id int auto_increment primary key,
    created_at datetime
);

insert into test_datetime(created_at) values('2015-11-05 14:29:36');

#假设您想知道在 2015-11-05 上创建了哪一行,不返回任何行,因为 created_at 列不仅包含日期，还包含时间
select * from test_datetime where created_at = '2015-11-05';

#按预期返回一行
select * from test_datetime where date(created_at) = '2015-11-05';

select time(@dt);

#获取年、季度、月、周、日、小时、分钟和秒，请使用以下语句中所示的 YEAR、QUARTER、MONTH、WEEK、DAY、HOUR、MINUTE 和 SECOND 函数
select year(@dt),
       quarter(@dt),
       month(@dt),
       week(@dt),
       day(@dt),
       hour(@dt),
       minute(@dt),
       second(@dt);