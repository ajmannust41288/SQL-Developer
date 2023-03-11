--SELECT * FROM emp5;
--highest salaray in the table 
SELECT * FROM emp5 where esal=(select max(esal) from emp5);
--second highest salary 
select * from emp5 where esal=(select max(esal) from emp5 where esal<(select max(esal) from emp5));
--third highest salary 
SELECT * FROM (select eid,ename,esal ,DENSE_RANK() over (order by esal DESC)ranking from emp5)where ranking=3;
select ename,esal,count(*) from emp5 where esal>=3000 having sum(esal)>=4000 group by ename,esal order by ename;
SELECT * FROM emp5 where ename LIKE 'a%';
SELECT * FROM emp5 where eadd LIKE 'w%';
--use of lag functions 
select ename,esal,LAG(esal,1,0) OVER (ORDER BY esal DESC) AS previous_sal from emp5;
select ename,esal,LAG(esal,2,0) OVER (partition by eadd ORDER BY esal DESC) AS previous_sal from emp5;
select ename,esal,LAG(esal,1,0) OVER (partition by eadd ORDER BY esal DESC) AS previous_sal from emp5;
select ename,esal,LEAD(esal, 1) OVER (ORDER BY esal desc) AS "Nextesal" from emp5;
select ename,esal,FIRST_VALUE(ename) OVER (ORDER BY esal ASC ) AS lowest_sal from emp5;
select ename,esal,FIRST_VALUE(ename) OVER (ORDER BY esal DESC ) AS highest_sal from emp5;
select ename,esal,LAST_VALUE(ename) OVER (ORDER BY esal ROWS BETWEEN 
UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_row from emp5;
SELECT eid,ename,eadd,esal,min(esal) keep(DENSE_RANK FIRST order by esal)
over(partition by eid) as lowest,
max(esal) keep(DENSE_RANK LAST order by esal)
over(partition by eid) as highest from emp5 order by eid,esal;
--this is min esal and max esal
select min(ename)KEEP(DENSE_RANK FIRST ORDER by esal) as min_ename,min(esal) as minesal,
max(ename) keep(DENSE_RANK last order by esal) as max_ename,max(esal) as maxesal from emp5;