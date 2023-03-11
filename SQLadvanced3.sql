Create table Department
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Go
Insert into Department values (1, 'IT', 'London', 'Rick')
Insert into Department values (2, 'Payroll', 'Delhi', 'Ron')
Insert into Department values (3, 'HR', 'New York', 'Christie')
Insert into Department values (4, 'Other Department', 'Sydney', 'Cindrella')
Go
Create table Employee
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int foreign key references Department(Id)
)
Go
Insert into Employee values (1, 'Tom', 'Male', 4000, 1)
Insert into Employee values (2, 'Pam', 'Female', 3000, 3)
Insert into Employee values (3, 'John', 'Male', 3500, 1)
Insert into Employee values (4, 'Sam', 'Male', 4500, 2)
Insert into Employee values (5, 'Todd', 'Male', 2800, 2)
Insert into Employee values (6, 'Ben', 'Male', 7000, 1)
Insert into Employee values (7, 'Sara', 'Female', 4800, 3)
Insert into Employee values (8, 'Valarie', 'Female', 5500, 1)
Insert into Employee values (9, 'James', 'Male', 6500, NULL)
Insert into Employee values (10, 'Russell', 'Male', 8800, NULL)
Go
select * from Department
select * from Employee
----------------task2--------Join
SELECT Name, Gender, Salary, DepartmentName
FROM Employee
JOIN Department
ON Employee.DepartmentId = Department.Id
--task3--------------left join 
SELECT Name, Gender, Salary, DepartmentName
FROM Employee
left JOIN Department
ON Employee.DepartmentId = Department.Id
--task4--------------right join 
SELECT Name, Gender, Salary, DepartmentName
FROM Employee
right JOIN Department
ON Employee.DepartmentId = Department.Id
--task5--------------full join 
SELECT Name, Gender, Salary, DepartmentName
FROM Employee
full JOIN Department
ON Employee.DepartmentId = Department.Id
--task6--------------cross join 
SELECT Name, Gender, Salary, DepartmentName
FROM Employee
cross JOIN Department
--task7--------------inner join 
SELECT Name, Gender, Salary, DepartmentName
FROM Employee
inner JOIN Department
on Employee.DepartmentId=Department.id
--Task8 sql part3 ------------
Create Table Gender
(ID int Not Null Primary Key,
Gender nvarchar(50))
--task9----------
Alter table Person 
add constraint Person_GenderId_FK FOREIGN KEY (GenderId) references Gender(ID)

