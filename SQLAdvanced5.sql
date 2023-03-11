--user 2 session
insert into test2 values('zzzz')
insert into test1 values('tttt')
--SQL part 9 -------------
create table test3
(
id int ,
value nvarchar(20)
)
--check
insert into test3 values(2,'ajman')
insert into test3 values(3,'ajman')
insert into test3 values(4,'ajman')
--check unique
insert into test3 values(2,'ajman')
--name unique
Alter Table test3
Add Constraint Constraint_value Unique(value)
select * from test3
insert into test3 values(5,'ajman')
--- Create Trigger on database and table 
create trigger safety 
on database
for 
create_table,alter_table,drop_table
as 
print 'You cannot create ,drop and alter on database db2'
create table test4 (id int primary key,name nvarchar(50),age int)
--Drop Trigger
DROP TRIGGER safety  
ON  DATABASE  
--lets check gain 
create table test5 (id int primary key,name nvarchar(50),age int)
insert into test5 values(2,'ajman',34),(3,'ajman2',38),(4,'ajman3',37),
(5,'ajman4',35),(6,'ajman5',36)
select * from test5
--- Trigger Drop Syntax ON DDL,DML,LOG------------------------------------------task13----start 
-- Trigger on an INSERT, UPDATE, or DELETE statement to a table or view (DML Trigger)  
  
DROP TRIGGER [ IF EXISTS ] [schema_name.]trigger_name [ ,...n ] [ ; ]  
  
-- Trigger on a CREATE, ALTER, DROP, GRANT, DENY, REVOKE or UPDATE statement (DDL Trigger)  
  
DROP TRIGGER [ IF EXISTS ] safety [ ,...n ]   
ON { DATABASE | ALL SERVER }   
[ ; ]  
  
-- Trigger on a LOGON event (Logon Trigger)  
  
DROP TRIGGER [ IF EXISTS ] trigger_name [ ,...n ]   
ON ALL SERVER
-------------------- ----------------------------------------task13 end -------------
-----------------------------sql part3 and part4 ---------Tricky
select * from Person
select * from Gender
alter table Person
---drop age 
drop column age
alter table Person
drop column id
-----add colunm
alter table Person
add  ID int
---insert values------------------create table person 5
create table person5(name nvarchar(20),email nvarchar(20),
id int,Genderid int)
insert into Person5 values('john','jo@gmail',1,1),
('Rohit','jo@gmail',2,2),('plan','jo@gmail',3,3),
('sara','jo@gmail',4,4),('jorry','jo@gmail',5,5)
go
-------------create and insert gender1
create table gender1(ID int,Gender nvarchar(20))
insert into gender1 values(1,'Male'),(2,'Female'),
(3,'Unknown')
-----------check table
select * from tblperson
select * from Gender
--lets try to delete id=2 from gender
delete from Gender where ID=2
--check the Default value id=2 is it 3
select * from Gender
select * from Person
select * from Gender
----------------
insert into Person(Name,Email,GenderId,Id) values('john','jo@gmail',1,3)
insert into Person(Name,Email,GenderId,Id) values('john','jo@gmail',3,4)
insert into Gender values(4,'Male'),(5,'Female')
insert into Person(Name,Email,GenderId,Id) values('ajman','jo@gmail',4,5)
insert into Person(Name,Email,GenderId,Id) values('Rehana','jo@gmail',5,6)
insert into Person(Name,Email,GenderId,Id) values('Kalim','jo@gmail',6,7)
----check table 
select * from Person
select * from Gender
---------
--lets try to delete id=2 from gender
delete from Gender where ID=3
--check the Default value id=2 is it 3
select * from Person
--insert some values to gender table 
insert into Gender values(2,'Male'),(6,'Female'),(3,'Male')
--lets update again 
update  Gender  set Gender='Male' where ID=6
--check table
select * from Person
select * from Gender
--delete id=4 from gender 
delete from Gender where ID=4
-- cascading ------------------
delete from Gender where ID in(5,6)
--check table
select * from Person
select * from Gender
-----------------------------------------end of sql part3 tricky -----lenghty sessions
--------how to create, execute, change and delete stored procedures.-------------------------
select * from  tblEmployee
create procedure spGetEmployee
as
begin
    select name,gender,city from tblEmployee
end
--just call stored procedure by name 
spGetEmployee
--execute proc
exec spGetEmployee
execute spGetEmployee
--stored procedure with parameter
create proc spGetEmployeeBYGenderAndDepartment
@gender nvarchar(20),
@city nvarchar(20)
as
begin
     select name,gender,city from tblEmployee
	 where gender=@gender and
	 city=@city
end
--lets execute stored procedure
 exec spGetEmployeeBYGenderAndDepartment 'Male','london'
--lets check table
select * from  tblEmployee
--aother way
exec spGetEmployeeBYGenderAndDepartment @gender='Male',@city='london'
--how to see the text of sp procedure
sp_helptext spGetEmployee
--How to change sp proc
alter proc spGetEmployee
as
begin
    select name,gender,city from tblEmployee order by name
end
--check again 
exec spGetEmployee
--how to drop sp 
drop proc spGetEmployee
--use encryption sp
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
--access text sp
sp_helptext spGetEmployeeBYGenderAndDepartment
----------------with Encryption
alter proc spGetEmployeeBYGenderAndDepartment
@gender nvarchar(20),
@city nvarchar(20)
with encryption
as
begin
     select name,gender,city from tblEmployee
	 where gender=@gender and
	 city=@city
end