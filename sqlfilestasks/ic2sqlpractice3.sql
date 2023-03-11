--SELECT * FROM emp5;
--How to create indexes in the database
--create index IX_emp5_esal on emp5(esal asc);
--SP_Helpindex emp5;
--how to drop index 
--drop index emp5.IX_emp5_esal;
--CREATE TABLE emp11 (id number primary key,name varchar(20),salary number,gender varchar(10),city varchar(20));
--INSERT INTO emp11 VALUES (3,'john',4500,'Male','New York')
--INSERT INTO emp11 VALUES (1,'sam',2500,'Male','London');
--INSERT INTO emp11 VALUES (4,'sara',3000,'Female','New York');
--INSERT INTO emp11 VALUES (5,'tod',3100,'Male','Tokyoo');
--INSERT INTO emp11 VALUES (2,'pam',6500,'Male','Syedny');
--SELECT * FROM emp11;
--How to create clustered index for than two 
--create table emp12
--(
--   person_id  integer not null, 
--   job_id     integer not null, 
--   primary key (person_id, job_id)
--)
--organization index;
--INSERT INTO emp12 VALUES (2,3344);
--INSERT INTO emp12 VALUES (3,3444);
--INSERT INTO emp12 VALUES (4,3544);
--INSERT INTO emp12 VALUES (5,3644);
--SELECT * FROM emp12;
--INSERT INTO emp12 VALUES (11,3341);
--INSERT INTO emp12 VALUES (7,3445);
--INSERT INTO emp12 VALUES (18,3542);
--INSERT INTO emp12 VALUES (13,3647);
--multiple clustered 
--create table emp13
--(
--   person_id   integer not null, 
--   job_id      integer not null, 
--   start_date  date, 
--   end_date    date,
--   primary key (person_id, job_id)
--)
--organization index
--including start_date
--overflow storage (initial 4k);
--INSERT INTO emp13 VALUES (12,3647,'07-jan-2021','01-feb-2022');
--INSERT INTO emp13 VALUES (18,3447,'05-jan-2021','01-feb-2022');
--INSERT INTO emp13 VALUES (11,3547,'02-jan-2021','01-feb-2022');
--INSERT INTO emp13 VALUES (9,3647,'03-jan-2021','01-feb-2022');
--INSERT INTO emp13 VALUES (22,3847,'04-jan-2021','01-feb-2022');
--SELECT * FROM emp13;
--INSERT INTO emp13 VALUES (10,3649,'03-jan-2021','01-feb-2022');
--INSERT INTO emp13 VALUES (23,3848,'04-jan-2021','01-feb-2022');
--nique constraint (SYSTEM.SYS_IOT_TOP_20375) violated below statement
--INSERT INTO emp13 VALUES (23,3848,'04-jan-2021','01-feb-2022');
--INSERT INTO emp13 VALUES (24,3848,'04-jan-2021','01-feb-2022');
--SELECT * FROM emp5;
--use of group by clause 
--select ename,count(*) from emp5 group by ename;
--select ename,count(*) from emp5 where esal<=2800 group by ename;
--select ename,max(esal) from emp5 group by ename;
--select ename,min(esal) from emp5 group by ename;
--select ename,max(esal),min(esal),avg(esal) from emp5 group by ename;
----use of having cluase in the oracle database
--SELECT ename,count(*) from emp5 having count(*)>=2 group by ename;
--SELECT ename,esal from emp5 having esal>=3400 group by ename,esal;
--SELECT ename,esal,count(*) from emp5 having esal<=2400 group by ename,esal;
----use of where,having,group by and order by
--SELECT ename,esal,count(*) from emp5 where esal>=2400 having sum(esal)>=5000 
--group by ename,esal
--order by ename;
--The most important part of interview is nth highest salary calulation
--select *
--  from
--  (
--    select
--        esal
--          ,dense_rank() over (order by esal desc) ranking
--    from   emp5
--  )
--  where ranking = 1 ;
--  smallest salary 
--select *
--  from
--  (
--    select
--        esal
--          ,dense_rank() over (order by esal asc) ranking
--    from   emp5
--  )
--  where ranking = 1 ;
--SELECT * FROM emp5;
--SELECT *
--    FROM (
--                SELECT eid,
--                       ename, esal,
--                       dense_rank( ) over ( order by esal desc) NRANK
--                FROM emp5
--            )
--    WHERE NRANK = 1
--use of Row functions 
--First highest
--select * from ( select distinct (esal),ROW_NUMBER() OVER (order by esal desc) rn from emp5 ) where rn=1;
--second highest salary
--select * from ( select distinct (esal),ROW_NUMBER() OVER (order by esal desc) rn from emp5 ) where rn=2;
--use of DESC LIMIT 
--select distinct(esal) from emp5 order by esal DESC limit 2,1;













