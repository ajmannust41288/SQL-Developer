create trigger trforinsertemploye on tblEmploye
for insert
as
begin
  insert into Employee values(11,'jalili','Male',80000,3)
end
--lets check tables 
select * from tblEmploye
select * from Employee
select * from Department
--insert values tblemploye
insert into tblEmploye values(11,'jamal','Male',79000,3)
insert into tblEmploye values(12,'Zubair khan','Male',89000,4)
--check 
select * from Employee
----------stored procedure output parameter 
create procedure spGetEmployeecountBygender 
@Gender nvarchar(20),
@EmployeeCount int output
as
begin
    select @EmployeeCount=COUNT(ID) from Employee where
	Gender=@Gender
end
----execute output sp
declare @Totalcount int
execute spGetEmployeecountBygender 'Male',@Totalcount output
if(@Totalcount is null)
 print'@totalcount is null'
 else
 print '@Totalcount is not null'
 print @Totalcount
 ---execute sp help 
 sp_help spGetEmployeecountBygender
 --sp_help for any table
 sp_help Employee
 sp_helptext spGetEmployeecountBygender
 --sp_depends
 sp_depends spGetEmployeecountBygender
 sp_depends Employee
 --lets take examples of stored proc
--trigger examples
select * from tblEmploye
select * from Employee
select * from Department
select * from tblEmploye
select * from tblDepartment
--insert values employee
insert into Employee values(12,'Zubair khan','Male',89000,3)
insert into Employee values(12,'Zubair khan','Male',89000,4)
insert into Employee values(13,'Zubair khan2','Male',89000,5)
insert into Department values(5,'HR','London','Ron'),(6,'HR','London','Ron')
insert into Department values(7,'HR','London','Ron'),(8,'HR','London','Ron')
select * from Department
insert into Employee values(14,'Zubair2','Male',99000,6)
insert into Employee values(15,'Emonn','Female',98000,7)
insert into Employee values(16,'Rahila','Female',98000,8)
insert into tblDepartment values(5,'IT','London','Rick')
insert into tblDepartment values(6,'HR','London','Rick')
insert into tblDepartment values(7,'Payroll','London','Rick')
insert into tblDepartment values(8,'Payroll','Delhi','Ron')
insert into tblEmploye values(12,'jamal3','Male',79000,5)
insert into tblEmploye values(13,'jamal4','Male',99000,6)
--examples ------------
select * from Employee
--lets execute trigger
create trigger tremployeebynamegender on Employee
for update
as
begin
   update Employee set Name='ajman' where ID=5
 end
 ------------stored proc
 create proc spGetDepartmentByNameLocation
 @Departmentname nvarchar(20),
 @Location nvarchar(20)
 as 
 begin
    select DepartmentName,Location from Department where
	DepartmentName=@Departmentname and Location=@Location
 end
 --lets execute 
 execute spGetDepartmentByNameLocation 'HR','London'
 exec spGetDepartmentByNameLocation 'HR','London'
 spGetDepartmentByNameLocation 'HR','London'
 ---lets change alter proc 
 alter proc spGetDepartmentByNameLocation
 @Departmentname nvarchar(20),
 @Location nvarchar(20)
 as 
 begin
    select * from Department where
	DepartmentName=@Departmentname and Location=@Location
 end
--lets check table
select * from Department
--lets exec sp again
exec spGetDepartmentByNameLocation 'HR','London'
--create sp with out
create proc spDepartmentByNamecount 
@DepartmentName nvarchar(20),
@IDcount int output
as
begin
    select @IDcount=COUNT(ID) from Department
	where DepartmentName=@Departmentname
end
--execute sp proc with output parameter
declare @TotalDepID int
exec spDepartmentByNamecount 'HR', @TotalDepID out
if(@TotalDepID is null)
  print'@TotalDepID is null'
else
 print '@TotalDepID  is no null'
  print @TotalDepID 
  --lets check
  sp_help spDepartmentByNamecount
  sp_helptext spDepartmentByNamecount
  sp_depends spDepartmentByNamecount
----------------with Encryption
alter proc spGetEmployeeBYGenderAndDepartment
@gender nvarchar(20),
@city nvarchar(20)
with Encryption
as
begin
     select name,gender,city from tblEmployee
	 where gender=@gender and
	 city=@city
end
----lets execute 
select * from tblEmployee
exec  spGetEmployeeBYGenderAndDepartment 'male','london'