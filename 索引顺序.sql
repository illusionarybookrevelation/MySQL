use testdb;

create table test (
    v int,
    index idx_v_asc(v),
    index idx_v_desc(v desc)
);
show index from test;

#使用下面的 sql 语句插入 10 万条数据
insert into test (v)
select (
    t4.i * 10000 + t3.i * 1000 + t2.i * 100 + t1.i * 10 + t0.i
           ) v
from (  SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION
        SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION
        SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION
        SELECT 9
    )t0,
    ( SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION
        SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION
        SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION
        SELECT 9
    )t1,
    ( SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION
        SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION
        SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION
        SELECT 9
    )t2,
    ( SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION
        SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION
        SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION
        SELECT 9
    )t3,
    ( SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION
        SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION
        SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION
        SELECT 9
    )t4
    order by v;

#输出显示该语句使用了 idx_v_asc 索引，这对应了语句中的 ORDER BY v 子句
explain select * from test order by v;

#输出显示该语句使用了 idx_v_desc 索引，这对应了语句中的 ORDER BY v DESC 子句
explain select * from test order by v desc;