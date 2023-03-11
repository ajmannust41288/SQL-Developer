create table sales2(customername varchar(20),productname varchar(20),Salary int ,vendorname varchar(20));
insert into sales2 values('stiev','shoes',1000,'batta'),('Raja','perfume',2000,'archive'),('sandra','shoes',4000,'batta'),('sandra','shoes',7000,'archives'),
('Zuhran','books',6000,'archive'),('Zubair','pencil',9000,'archive'),('jalil','shoes',3500,'batta'),('Numan','perfume',12000,'eternal'),
('waqas','shoes',3500,'sport'),('sanan','shoes',3000,'captain'),('kadir','perfume',15000,'chastity');
insert into sales2 values('jamania','perfume',4500,'vanily'),('tahir','perfume',23000,'eternal'),('sandra3','shoes',4500,'batta'),('sandra5','shoes',7600,'archives'),
('Zuhran3','books',6500,'archive'),('Zubair3','pencil',9600,'archive'),('jalil5','shoes',3800,'batta'),('Numan4','perfume',15000,'eternal'),
('waqas5','shoes',8500,'sport'),('sanan5','shoes',3600,'captain'),('kadir5','perfume',18000,'chastity');
select * from sales2;
--Top 5 salary list 
select Salary from (select DISTINCT TOP 5 Salary from sales2 order by salary desc) result;
--Top 2 salary list 
select Salary from (select DISTINCT TOP 2 Salary from sales2 order by salary desc) result;
select  Salary from (select DISTINCT TOP 10 Salary from sales2 order by salary desc) result;
select  Salary from (select DISTINCT TOP 10 Salary from sales2 order by salary desc) result order by Salary;
select Salary from (select distinct  top 2 Salary from sales2 order by Salary desc) result order by Salary;
--nth highest salary using sub query
select top 1 Salary from 
(select distinct  top 5 Salary from sales2 order by Salary desc) result 
order by Salary desc;
--This will show the rank of each top salary 
select top 1 Salary,
DENSE_RANK() over 
(order by salary desc) as denserank from sales2;
--this is with the common expression of table finding second highest salary 
-- nth number of highest salary cte
with result as
(
select Salary,DENSE_RANK() over (order by salary desc) as denserank from sales2
)
select  Salary 
from result
where result.denserank=10;
 