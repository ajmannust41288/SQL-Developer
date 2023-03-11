select * from tblEmployee
select * from tblEmploye
select * from tblDepartment
select * From Employee2
---lets create another table with Foreign key 
Create table Employee2
(
ID int primary key,
Name nvarchar(50),
Gender nvarchar(50),
Salary int,
DepartmentId int foreign key references tblDepartment(ID)
)
Go
Insert into Employee2 values (1, 'Tom', 'Male', 4000, 1)
Insert into Employee2 values (2, 'Pam', 'Female', 3000, 3)
Insert into Employee2 values (3, 'John', 'Male', 3500, 1)
Insert into Employee2 values (4, 'Sam', 'Male', 4500, 2)
Insert into Employee2 values (5, 'Todd', 'Male', 2800, 2)
Insert into Employee2 values (6, 'Ben', 'Male', 7000, 1)
Insert into Employee2 values (7, 'Sara', 'Female', 4800, 3)
Insert into Employee2 values (8, 'Valarie', 'Female', 5500, 1)
Insert into Employee2 values (9, 'James', 'Male', 6500, NULL)
Insert into Employee2 values (10, 'Russell', 'Male', 8800, NULL)
-------
Insert into Employee2 values (11, 'Todd', 'Male', 2800, 4)
Insert into Employee2 values (12, 'Ben', 'Male', 7000, 5)
Insert into Employee2 values (13, 'Sara', 'Female', 4800, 6)
Insert into Employee2 values (14, 'Valarie', 'Female', 5500, 7)
Insert into Employee2 values (15, 'James', 'Male', 6500, 8)
Insert into Employee2 values (16, 'Russell', 'Male', 8800, 7)
Go
---check tables again
select * from tblDepartment
select * From Employee2
--lets check foreign key vales greater than id >8 which is not in tbldeparment
Insert into Employee2 values (17, 'Russell34', 'Male', 8800, 9)
---sp proc
create proc spGetEmployee2ByNameGenderSalary
@Name nvarchar(20),
@Gender nvarchar(20)
as
 begin
     select Name,Gender,Salary from Employee2 where Name=@Name and Gender=@Gender 
  end
  --exec sp 
  select * From Employee2
   exec spGetEmployee2ByNameGenderSalary 'Sara','Female'
   exec spGetEmployee2ByNameGenderSalary 'John','Male'
   sp_helptext spGetEmployee2ByNameGenderSalary
   ---lets sp for upodate 
   create proc spUpEmployeename
   @name nvarchar(20),
   @gen nvarchar(20)
   as
   begin
       update Employee2 set Name=@name , Gender=@gen where ID>=17
   end
   exec spUpEmployeename 'ajman','Male'
   --create Stored proc with output para
   create proc spGetEmployeenameGenderDepartmentid
   @gender nvarchar(20),
   @TotalEmp int output
   as
   begin 
       select @TotalEmp=COUNT(ID) from Employee2 where
	   Gender=@gender
   end
   --exexute for male employee
   declare @TotalEMPcount int
   exec spGetEmployeenameGenderDepartmentid 'Male', @TotalEMPcount output
   print @TotalEMPcount 
   --Execute for Female employee
    declare @TotalEMPcount int
   exec spGetEmployeenameGenderDepartmentid 'Female', @TotalEMPcount output
   print @TotalEMPcount 
