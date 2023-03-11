Create table Employees
(
 EmployeeID int primary key identity,
 EmployeeName nvarchar(50),
 ManagerID int foreign key references Employees(EmployeeID)
)
GO

Insert into Employees values ('John', NULL)
Insert into Employees values ('Mark', NULL)
Insert into Employees values ('Steve', NULL)
Insert into Employees values ('Tom', NULL)
Insert into Employees values ('Lara', NULL)
Insert into Employees values ('Simon', NULL)
Insert into Employees values ('David', NULL)
Insert into Employees values ('Ben', NULL)
Insert into Employees values ('Stacy', NULL)
Insert into Employees values ('Sam', NULL)
GO
create table tblEmployee
(
id int identity ,
name varchar(20),
gender varchar(20),
salary int,
city varchar(20)
)

insert into tblEmployee values ('tom','male',4000,'london')
insert into tblEmployee values ('pam','female',3000,'newyork')
insert into tblEmployee values ('john','male',3500,'london')
insert into tblEmployee values ('sam','male',4500,'london')
insert into tblEmployee values ('tod','male',2800,'sydney')
insert into tblEmployee values ('ben','male',7000,'newyork')
insert into tblEmployee values ('sara','female',4800,'sydney')
insert into tblEmployee values ('valarie','female',5500,'newyork')
insert into tblEmployee values ('james','male',6500,'london')
insert into tblEmployee values ('russel','male',8800,'london')
select * from tblEmployee;
select city,sum(salary) as totalsalary from tblEmployee group by city;
select gender,city,sum(salary) as totalsalary from tblEmployee group by gender,city;
select gender,city,sum(salary) as totalsalary,count(id) as totalemployee from tblEmployee group by gender,city;
-- before aggregation    we use where 
select gender,city,sum(salary) as totalsalary
from tblEmployee where city='london' group by gender,city;
--having after aggregation 
select gender,city,sum(salary) as totalsalary
from tblEmployee group by gender,city having city='london';
Select City, SUM(Salary) as TotalSalary
from tblEmployee
Where Gender = 'Male'
group by City
Having City = 'London'
-- types o join examples 
Create table tblDepartment
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Go

Insert into tblDepartment values (1, 'IT', 'London', 'Rick')
Insert into tblDepartment values (2, 'Payroll', 'Delhi', 'Ron')
insert into tblDepartment values (3, 'HR', 'New York', 'Christie')
Insert into tblDepartment values (4, 'Other Department', 'Sydney', 'Cindrella')
Go

Create table tblEmploye
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int foreign key references tblDepartment(Id)
)
Go

Insert into tblEmploye values (1, 'Tom', 'Male', 4000, 1)
Insert into tblEmploye values (2, 'Pam', 'Female', 3000, 3)
Insert into tblEmploye values (3, 'John', 'Male', 3500, 1)
Insert into tblEmploye values (4, 'Sam', 'Male', 4500, 2)
Insert into tblEmploye values (5, 'Todd', 'Male', 2800, 2)
Insert into tblEmploye values (6, 'Ben', 'Male', 7000, 1)
Insert into tblEmploye values (7, 'Sara', 'Female', 4800, 3)
Insert into tblEmploye values (8, 'Valarie', 'Female', 5500, 1)
Insert into tblEmploye values (9, 'James', 'Male', 6500, NULL)
Insert into tblEmploye values (10, 'Russell', 'Male', 8800, NULL)
Go
SELECT  Name, Gender, Salary, DepartmentName
FROM tblEmploye
CROSS JOIN tblDepartment
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmploye
INNER JOIN tblDepartment
ON tblEmploye.DepartmentId = tblDepartment.Id
--join and inner join are same 
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmploye
JOIN tblDepartment
ON tblEmploye.DepartmentId = tblDepartment.Id
--left outer join
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmploye
LEFT OUTER JOIN tblDepartment
ON tblEmploye.DepartmentId = tblDepartment.Id
-- you may use left join
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmploye
LEFT JOIN tblDepartment
ON tblEmploye.DepartmentId = tblDepartment.Id
-- Right outer join
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmploye
RIGHT OUTER JOIN tblDepartment
ON tblEmploye.DepartmentId = tblDepartment.Id
--OR
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmploye
RIGHT JOIN tblDepartment
ON tblEmploye.DepartmentId = tblDepartment.Id
--Full outer join 
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmploye
FULL OUTER JOIN tblDepartment
ON tblEmploye.DepartmentId = tblDepartment.Id
--OR
SELECT Name, Gender, Salary, DepartmentName
FROM tblEmploye
FULL JOIN tblDepartment
ON tblEmploye.DepartmentId = tblDepartment.Id
-- lets take another examples
Create Table TableEmployer
(
ID int identity(1,1)Primary Key NOT NULL,
Name nchar(50) Not NULL,
Gender nchar(10) NOT NULL,
Salary int Not NULL,
DepartamentID int
)

Create Table TableDepartament
(
ID int identity(1,1)Primary Key,
DepartamentName nchar(50) Not NULL,
Location nchar(59) Not Null,
DepartamentHead nchar(50) Not Null,

)
Alter Table TableEmployer
Add Constraint CK_TableEmployer_Salary
CHECK(Salary > 0)
Alter Table TableEmployer
ADD CONSTRAINT CK_TableEmployer_Gender
CHECK(Gender = 'Female' OR Gender = 'Male' OR Gender ='Unknown')
ALTER TABLE TableEmployer
ADD CONSTRAINT CK_TableEmployer_DepartamentID
CHECK(DepartamentID>=1 AND DepartamentID<=4)
INSERT INTO TableEmployer values ('Tom','Male',4000,1) 
Insert into TableEmployer values('Ron','Male',4000,1)
Insert into TableEmployer values('Jessie','Female',4800,3)
Insert into TableEmployer values('Pam','Female',3500,1)
Insert into TableEmployer values('John','Male',3000,2)
Insert into TableEmployer values('Sam','Male',4500,2)
Insert into TableEmployer values('Linlna','Female',7300,3)
Insert into TableEmployer values('Artesa','Female',4000,2)
Insert into TableEmployer values('Dom','Male',5500,1)
Insert into TableEmployer values('Mayer','Male',9000,3)
Insert into TableEmployer values('Aryueta','Female',3000,2)
Insert into TableEmployer values('Bangklor','Male',4560,1)
--Insert into TableEmployer values('Bangklor','Male',4560,5) 
Select Name ,Gender ,Salary ,DepartamentID
From TableEmployer
INNER JOIN TableDepartament
ON TableEmployer.DepartamentID = TableDepartament.ID

Select Name ,Gender ,Salary ,DepartamentID
From TableEmployer
LEFT JOIN TableDepartament
ON TableEmployer.DepartamentID = TableDepartament.ID
select * from TableEmployer;
Select Name ,Gender ,Salary ,DepartamentID
From TableEmployer
RIGHT OUTER JOIN TableDepartament
ON TableEmployer.DepartamentID = TableDepartament.ID

Select Name ,Gender ,Salary ,DepartamentID
From TableEmployer
FULL OUTER JOIN TableDepartament
ON TableEmployer.DepartamentID = TableDepartament.ID

Select Name ,Gender ,Salary ,DepartamentID
From TableEmployer
CROSS JOIN TableDepartament
-- doesn't need a clause ON TableEmployer.DepartamentID = TableDepartament.ID
-- CROSS PRODUCES CONTATION PRODUCTS LEFTTABLE X RIGHTTABLE
-- IT TAKES EACH RECORD FROM LEFT TABLE AND ASSOCIATES WITH RIGHT TABLE

/*Select ColumnList
From LeftTable
JoinType RighTable
ON JoinCondition */ -- GENERIC IDEA ON HOW TO CREATE A JOIN
Select Name,Gender,Salary ,DepartamentID
From TableEmployer
/* any join */ INNER JOIN TableDepartament
ON TableEmployer.DepartamentID = TableDepartament.ID