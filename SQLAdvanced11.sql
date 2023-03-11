select * from TableEmployer
---convert into lower cases
select LOWER('ajman khan WAZIR is The man of engineering')
select upper('ajman khan WAZIR is The man of engineering')
select reverse('ajman khan WAZIR is The man of engineering')
select len('ajman khan WAZIR is The man of engineering')
 Select RIGHT('ABCDE', 3)
 Select left('ABCDE', 3)
 select CHARINDEX('@','ajman41288@gmail.com',1) ind;
 select SUBSTRING('ajman41288@gmail.com',6,len('ajman41288@gmail.com'))
 Select SUBSTRING('John@bbb.com',(CHARINDEX('@', 'John@bbb.com') + 1), 
 (LEN('John@bbb.com') - CHARINDEX('@','John@bbb.com')))
 --lets create a table 
 create table test8(id int,fname nvarchar(20),lname nvarchar(20),email nvarchar(20))
 insert into test8 values(1,'sam','sony','sam@aaa.com'),
 (2,'ram','sony','sam@aaa.com'),(3,'fam','fony','sam@aaa.com'),
 (4,'jam','sony','jam@aaa.com'),(5,'sam','sony','sam@aaa.com'),
 (6,'zam','sony','sam@aaa.com'),(7,'raam','sony','sam@aaa.com'),
 (8,'wam','sony','sam@aaa.com'),(9,'pam','sony','sam@aaa.com'),
 (10,'qam','sony','sam@aaa.com'),(11,'tam','sony','sam@aaa.com'),
 (12,'uam','sony','sam@aaa.com'),(13,'xam','sony','sam@aaa.com')
 select * from test8
 Select SUBSTRING('John@bbb.com',(CHARINDEX('@', 'John@bbb.com') + 1),
 (LEN('John@bbb.com') - CHARINDEX('@','John@bbb.com')))
 --------------------------------------------------------
 Select SUBSTRING(email, CHARINDEX('@', email) + 1,
LEN(email) - CHARINDEX('@', email)) as EmailDomain,
COUNT(email) as Total
from test8
Group By SUBSTRING(email, CHARINDEX('@', email) + 1,
LEN(email) - CHARINDEX('@', email))
--------------------------
 insert into test8 values(13,'paream','sony','bam@aaa.com'),
 (14,'eeam','sony','bam@aaa.com'),
 (15,'iopam','sony','bam@aaa.com')
 select * from test8
 -------------------------------
  Select SUBSTRING(email, CHARINDEX('@', email) + 1,
LEN(email) - CHARINDEX('@', email)) as EmailDomain,
COUNT(email) as Total
from test8
Group By SUBSTRING(email, CHARINDEX('@', email) + 1,
LEN(email) - CHARINDEX('@', email))
----------------------------------------------
insert into test8 values(16,'paream2','sony','bam@kkk.com'),
 (17,'eeam2','sony','bam@rrr.com'),
 (18,'iopam2','sony','bam@BBB.com')
 ------------------------------------------------------------
  select * from test8
  --------------------------
   Select SUBSTRING(email, CHARINDEX('@', email) + 1,
LEN(email) - CHARINDEX('@', email)) as EmailDomain,
COUNT(email) as Total
from test8
Group By SUBSTRING(email, CHARINDEX('@', email) + 1,
LEN(email) - CHARINDEX('@', email))
----------------------------------------
------------------------------------Triggers types and uses ---------------
select * From tblEmploye
CREATE TABLE tblEmployee2
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)
--Insert data into tblEmployee table
Insert into tblEmployee2 values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee2 values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee2 values (3,'Pam', 6000, 'Female', 1)
--------------------------
CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)
----- create triggers 
CREATE TRIGGER tr_tblEmployee2_ForInsert
ON tblEmployee2
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) 
 + ' is added at ' + cast(Getdate() as nvarchar(20)))
END
------------
Insert into tblEmployee2 values (7,'Tan', 2300, 'Female', 3)
----------------how to delete the trigers 
CREATE TRIGGER tr_tblEMployee_ForDelete
ON tblEmployee2
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + 
 ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
END
----------------------------------------------------
select * from tblEmployee2
select * from tblEmployeeAudit