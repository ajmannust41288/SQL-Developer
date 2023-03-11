insert into tblEmployee4 values('ajman1','khan',7),
('ajman2','khan',2),('ajman3','khan',3),('ajman4','khan',4),
('ajman5','khan',5),('ajman6','khan',7),('ajman7','khan',5)
----------------------------------------------------
select * from  tblEmployee4
select * from  TableDepartament
-----------------------------------------------
insert into TableDepartament values('EE','NUCES','sajid mahmood'),
('ME','NUCES','Bilal Khalid'),('ME','NUCES','Bilal khalid'),
('EE','NUCES','sajid mahmood'),('EE','NUCES','sajid mahmood'),
('EE','NUCES','sajid mahmood'),('EE','NUCES','sajid mahmood')
----------------------------
select * from  tblEmployee4
select * from  TableDepartament
-----------------
insert into tblEmployee4 values('akram1','khan',8),
('akram2','khan',9),('akram3','khan',10),('akram4','khan',11),
('akram5','khan',12),('akram6','khan',13),('akram7','khan',14)
-----------
select * from  tblEmployee4
select * from  TableDepartament
--- lets creayte view in a database 
create view view_tbleemployee_department 
as 
select emp.Employeeid,emp.Firstname,emp.Lname,dp.DepartamentName,
dp.Location,dp.DepartamentHead 
from tblEmployee4 emp
join TableDepartament dp on emp.Departmentid=dp.ID; 
--- ------------------alter view 
select * from  view_tbleemployee_department ;
alter  view view_tbleemployee_department
as 
select emp.Employeeid,emp.Firstname,emp.Lname,dp.DepartamentName,
dp.Location,dp.DepartamentHead 
from tblEmployee4 emp
join TableDepartament dp on emp.Departmentid=dp.ID 
where emp.Employeeid<=25;
---lets create another view to check 
select * from test5
select * from test4
------------insert values into test4
insert into test4 values(3,'zubair2',54),
(4,'zubair3',74),(5,'zubair4',90),(6,'zubair5',94),
(7,'zubair6',64),(8,'zubair7',54),(9,'zubair8',84),
(10,'zubair9',54),(11,'zubair10',74),(12,'zubair11',64)
-----------
insert into test5 values(7,'akram2',94),
(8,'akram3',64),(9,'akram4',80),(10,'akram5',64),
(11,'akram6',44),(12,'akram7',54),(13,'akram8',34)
---------------
 select * from view_tbleemployee_department;
 select * from test5
select * from test4
create view view_test5_test4
as
select p1.name as p1name,p1.age as p1age,p2.name as p2name,p2.age as p2age
from test5 p1 join
test4 p2 
on p1.id=p2.id;
---lets execute view
select * from view_test5_test4;
 select * from test5
select * from test4
----alter 
alter view view_test5_test4
as
select p1.name as Data_Aanalyst,p1.age as Data_Analyst_age,
p2.name as Technical_product_support,p2.age as TPS_age
from test5 p1 join
test4 p2 
on p1.id=p2.id;
-----------
alter view view_test5_test4
as
select p1.name as Data_Analyst,p1.age as Data_Analyst_age,
p2.name as Technical_product_support,p2.age as TPS_age
from test5 p1 join
test4 p2 
on p1.id=p2.id;
--------------
select * from view_test5_test4;
 select * from test5
select * from test4
---- drop the view 
DROP VIEW view_tbleemployee_department ; 
----- also check 
IF OBJECT_ID('view_tbleemployee_department', 'V') IS NOT NULL  
    DROP VIEW view_tbleemployee_department;
	----------------------------------
	select * from Department
	select * from tblDepartment
	---- create view
	create view view_Department
	as
	select d1.DepartmentName D1name,d1.Location D1Location,
	d1.DepartmentHead D1DHead,d2.DepartmentName D2Name,d2.Location D2Location,
	d2.DepartmentHead D2DName from
	Department d1 join tblDepartment d2 on
	d1.ID=d2.ID;
	------------------------------
	select * from view_Department;
	select * from employee
	------------create functions 
CREATE or alter function GetAvgSalary(@DeptID int)  
RETURNS float   --returns float type value
    AS 
    BEGIN
        
        DECLARE @avgSal float = 0; --declares float variable 
    
        -- retrieves average salary and assign it to a variable 
        SELECT @avgSal =  AVG(Salary) FROM  employee
        WHERE Departmentid = @DeptID  
        RETURN @avgSal; --returns a value
    END
	----lets execute
	select dbo.GetAvgSalary(5);



