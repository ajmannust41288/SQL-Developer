/****** Script for SelectTopNRows command from SSMS  ******/
select COUNT(*) from Sales.SalesPerson;
select * from dbo.Employee;
select  color ,COUNT(*) from dbo.cars  group by color  having COUNT(*)<=4;
alter table dbo.Employee add salary int ;
update dbo.Employee set salary=4000 where Employeenumber<=5;
select SUM(salary)as totalsalary  from dbo.Employee where Employeenumber<=5 group by Employeename;
select SUM(salary)as totalsalary  from dbo.Employee where Employeenumber<=5 group by Employeename having sum(salary)>=1200;
select avg(salary)as totalsalary  from dbo.Employee ;
insert into dbo.Employee values(20,'haris','india',5642,5600),(21,'haris','india',5642,900),(22,'haris','india',5682,700),(23,'haris','india',5742,1300);
select min(salary)as maxsal  from dbo.Employee ;
create view view_employee as select Employee.Employeename,Employee.Employeecountry from dbo.Employee where Employeenumber<=18;
select * from view_employee;
