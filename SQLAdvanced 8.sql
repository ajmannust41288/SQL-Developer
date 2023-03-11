select * from Employee2
Create Procedure spGetTotalCountOfEmployees
@TotalCount int output
as
Begin
 Select @TotalCount = COUNT(ID) from Employee2
End
--lets exec 
Declare @TotalEMployee int
exec spGetTotalCountOfEmployees @TotalEMployee output
select @TotalEMployee
--use return in sp
Create Procedure spGetTotalCountOfEmployees2
as
Begin
 return (Select COUNT(ID) from Employee2)
End
--execute again 
Declare @TotalEmployees int
Execute @TotalEmployees = spGetTotalCountOfEmployees2
Select @TotalEmployees
--lets without return
create proc spGetNameById1
@id int,
@name nvarchar(20) output
as
begin 
  select Name=@name from Employee2 where ID=@id
 end
  -- exec sp
  declare @EmployeeName nvarchar(20)
  exec spGetNameById1 3,@EmployeeName output
  print 'EmployeeName = ' + @EmployeeName
  --lets check table 
  select * from Employee2
  --lets check with return 
  Create Procedure spGetNameById2
@Id int
as
Begin
 Return (Select Name from Employee2 Where ID = @Id)
End
--exec
Declare @EmployeeName nvarchar(20)
Execute @EmployeeName = spGetNameById2 1
Print 'Name of the Employee = ' + @EmployeeName
--So, using return values, we can only return integers, and that too,
--only one integer. It is not possible, to return 
--more than one value using return values, where as output parameters, can return any
--datatype and an sp can have more than one output parameters. 
--I always prefer, using output parameters, over RETURN values.
--In general, RETURN values are used to indicate success or failure of 
--stored procedure, especially when we are dealing with nested stored procedures.
--Return a value of 0, indicates success, and any nonzero value indicates failure.
------------------------------Advantages of SQL  SP Proc--------------  :-------------
--The following advantages of using Stored Procedures over adhoc queries (inline SQL)
--1. Execution plan retention and reusability --- Stored Procedures are compiled and their execution plan is 
--cached and used again, when the same SP is executed again. Although adhoc queries also 
--create and reuse plan, the plan is reused only when the query is textual match and the 
--datatypes are matching with the previous call. Any change in the datatype or 
--you have an extra space in the query then, a new plan is created.

--2. Reduces network traffic --- You only need to send, EXECUTE SP_Name statement,
--over the network, instead of the entire batch of adhoc SQL code.

--3. Code reusability and better maintainability---- A stored procedure can be reused with 
--multiple applications. If the logic has to change, we only have one place to change,
--where as if it is inline sql, and if you have to use it in multiple applications, 
--we end up with multiple copies of this inline sql. If the logic has to change,
--we have to change at all the places, which makes it harder maintaining inline sql.

--4. Better Security ------ A database user can be granted access to an SP 
--and prevent them from executing direct "select" statements against a table.  
--This is fine grain access control which will 
--help control what data a user has access to.
select * from Employee2
select * from tblEmployee
create proc spGetNameByid
@id int
as
begin
    select name from tblEmployee where id=@id
end
--exec proc 
execute spGetNameByid 1
execute spGetNameByid 2
execute spGetNameByid 3
--adhoc sql queries 
select name from tblEmployee where id=1
select name from tblEmployee where id=2
select name from tblEmployee where id=3
select  Ascii('A')--65
select  Ascii('a')--97
select  Ascii('z')--122
select CHAR(65)--A
select CHAR(65)--A
declare @start int
set @start=65
while (@start<=90)
begin
     print CHAR(@start) 
	 set @start=@start+1
end
----lets check or small character
declare @start2 int
set @start2=97
while (@start2<=122)
begin
     print CHAR(@start2) 
	 set @start2=@start2+1
end
--0 to 9 
select CHAR(0)--A
select  Ascii(0)--48
select  Ascii(9)--57
declare @start3 int 
set @start3=48
while (@start3<=57)
begin
    print char(@start3)
	set @start3=@start3+1
end
--ltrim fun 
select LTRIM('    ajman')
select RTRIM('ajman    ')
create table test6(name nvarchar(20))
insert into test6 values('    ajman'),('     kalim'),
('      zeeshan'),('arif    '),('akram       '),
('zubair        ')
--check table 
select * from test6
select LTRIM(name)  as ltrname from test6
