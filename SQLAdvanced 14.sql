select * from Employee2
-----
create proc sp_emplnamegender
as
begin
 select ID,
  Name,Gender from 
   Employee2
end
-- exex
exec sp_emplnamegender
----------------------------
select * from test5
-------------------
create proc sp_test5_id_name
(@id int,
@name nvarchar(50),
@age int
 )
 as 
 begin
  insert into test5(id,name,age)
  values(
    @id,@name,@age
	)
  end
  ---exec
  exec sp_test5_id_name 18,'suliman khan',34
  exec sp_test5_id_name 19,'Noman khan',36
  select * from test5
  sp_help sp_test5_id_name 
  sp_helptext sp_test5_id_name
  sp_rename  'sp_test5_id_name' , 'Sp_Test5idname' 
  ----------------------------
  CREATE PROCEDURE uspUpdateEmpSalary
(
     @empId int
     ,@salary float
)
AS
BEGIN TRY
    UPDATE tblEmploye
    SET Salary = @salary
    WHERE ID = @empId
END TRY
BEGIN CATCH
    SELECT
    ERROR_NUMBER() as ErrorNumber,
	ERROR_SEVERITY() as ErrorSeverity,
	ERROR_STATE() as ErrorState,
	ERROR_MESSAGE() as ErrorMessage;
END CATCH
select * from tblEmploye
exec uspUpdateEmpSalary 3,85000
----
create proc sp_employee_salaraymoney
@id int,
@salary money
as
begin 
    update tblEmploye
	set Salary=	@salary
	where ID=@id
	end
	-----------------
	exec sp_employee_salaraymoney 2,99000
	select * from tblEmploye
	----lets take another examples 
	select * from player
	create proc sp_Playerproc
	(@rank int,
	@name nvarchar(20),
	@best int)
	as 
	begin
	 insert into player(rank,name,best)
	 values
	 (@rank,@name,@best)
     end
	 ---
	 exec sp_Playerproc 6,'ajman',198
	 -----
	 select * from player
	 select * from tblDepartment
	 create proc sp_Departmenthead
	 @empid int,
	 @Dephead nvarchar(20) output
	 as
	 begin 
	   select DepartmentHead=@Dephead
	   from tblDepartment
	    where ID=@empid
		end
		---execution 
		declare @Dephead varchar(20)
		exec sp_Departmenthead 5,@Dephead output
		print @Dephead
		--------------create cluster indexes
	CREATE TABLE EmployeeDetails(
	EmployeeID int NOT NULL,
	PassportNumber varchar(50) NULL,
	ExpiryDate date NULL)
Insert into EmployeeDetails values(3,'A5423215',null);
Insert into EmployeeDetails values(5,'A5423215',null);
Insert into EmployeeDetails values(2,'A5423215',null);
Insert into EmployeeDetails values(8,'A5423215',null);
Insert into EmployeeDetails values(1,'A5423215',null);
Insert into EmployeeDetails values(4,'A5423215',null);
Insert into EmployeeDetails values(6,'A5423215',null);
Insert into EmployeeDetails values(7,'A5423215',null);
-------
select * from EmployeeDetails
	   ---create clustered index 
CREATE CLUSTERED INDEX CIX_EmpDetails_EmpId
 ON EmployeeDetails(EmployeeID);
 ---
 select * from EmployeeDetails
 ----
 create clustered index Cix_empdetails_idandPass
 on EmployeeDetails(EmployeeID ASC,PassportNumber Desc);
 ----Drop index 
 Drop  index CIX_EmpDetails_EmpId
 on EmployeeDetails;
 ---create another 
  create clustered index Cix_empdetails_idandPass
 on EmployeeDetails(EmployeeID ASC,PassportNumber Desc);
 ------check table 
  select * from EmployeeDetails
  -- drop cluter index
  select * from tblEmployee
  --- create non-clustored index
  select * from Person
  create nonclustered index ncix_Email
  on Person(Email);

  --- crete trigger
  CREATE TABLE EmpLog (
	LogID int IDENTITY(1,1) NOT NULL,
	EmpID int NOT NULL,
	Operation nvarchar(10) NOT NULL,
	UpdatedDate Datetime NOT NULL	
)
CREATE TABLE TblEmployeek (
	LogID int IDENTITY(1,1) NOT NULL,
	EmpID int NOT NULL,
	Operation nvarchar(10) NOT NULL,
	UpdatedDate Datetime NOT NULL	
)
------------------
CREATE TRIGGER  trgEmployeeKInsert
ON TblEmployeek2
FOR INSERT	
AS
    INSERT INTO EmpLog(EmpID, Operation, UpdatedDate)
    SELECT DepartmentID ,'INSERT',GETDATE() FROM INSERTED; --virtual table INSERTED
	---------------
	create table TblEmployeek2(FirstName  nvarchar(20),
	LastName nvarchar(20) 
           ,EMail nvarchar(20) 
           ,Phone int 
           ,HireDate date 
           ,ManagerID int 
           ,Salary int 
           ,
		   DepartmentID int )
	INSERT INTO TblEmployeek2
     VALUES('Manisha2'
           ,'Dutt2'
           ,'MD456@abc.com'
           ,689
           ,'11/07/2015'
           ,7
           ,50000
           ,30),
		   ('Manisha5'
           ,'Dutt5'
           ,'MD456@5abc.com'
           ,676
           ,'11/07/2015'
           ,9
           ,50000
           ,35)
		   ----------------
		    select * from EmpLog
		    select * from TblEmployeek2 
insert into  TblEmployeek2 values('ajman','khan','ajman41288@gmail.com',678,'11/08/2022',76,780000,67)
 select * from EmpLog
select * from TblEmployeek2 
---- create trigger
select * from sales2
select * from sales
create trigger trgsalesinsert
on sales
for insert
as 
 insert into sales2(customername,productname,Salary,vendorname)
 select customername,productname, 'INSERT', getdate() from inserted; 
 insert into sales values('ajman','perfume',67000,'batta')
 ----after insert
 CREATE TRIGGER  trgEmployeeKafterinsert
ON TblEmployeek2
after update	
AS
    INSERT INTO EmpLog(EmpID, Operation, UpdatedDate)
    SELECT DepartmentID ,'INSERT',GETDATE() FROM INSERTED; --virtual table INSERTED
	--------------------
	insert into  TblEmployeek2 values('ajmanullah','khan','ajman41288@gmail.com',698,'11/08/2022',86,980000,87)
 select * from EmpLog
select * from TblEmployeek2 
CREATE TRIGGER dbo.trgInsteadOfDelete 
ON TblEmployeeK2
INSTEAD OF DELETE
AS
    INSERT INTO EmpLog(EmpID, Operation, UpdatedDate)
    SELECT DepartmentID,'DELETE', GETDATE() FROM DELETED;
	DELETE FROM TblEmployeek2
     WHERE DepartmentID = 87;
	 ---check both table 
	 select * from EmpLog
     select * from TblEmployeek2 
	 ------
	  select * from tblEmployee
      select * from tblEmployeeAudit
	  sp_helptext  trforinsertemploye
	  ---
	  create trigger tr_tblemployee_forinsert
	  on tblEmployee
	  for insert 
	  as 
	  begin 
	      select * from inserted
	 --   declare @id int,
		--select @id=id from inserted
		--insert into tblEmployeeAudit
		--values('new employee with id = '+CAST(@id as nvarchar(5))+ 'is added at '
		end
		-----------------
		INSERT INTO [dbo].[tblEmployee]
           ([name]
           ,[gender]
           ,[salary]
           ,[city])
     VALUES
           ('ajman','Male',90000,'bannu')
		   ---------
alter  trigger tr_tblemployee_forinsert
	  on tblEmployee
	  for insert 
	  as 
	  begin 
	      select name,salary,city from inserted
	 --   declare @id int,
		--select @id=id from inserted
		--insert into tblEmployeeAudit
		--values('new employee with id = '+CAST(@id as nvarchar(5))+ 'is added at '
		end
		-----------------------insert 
		INSERT INTO [dbo].[tblEmployee]
           ([name]
           ,[gender]
           ,[salary]
           ,[city])
     VALUES
           ('zeeshan','Male',90000,'lahore'),
		   ('kalim','male',89000,'bannu')
		   -------------------
		   select * from tblEmploye
  alter   trigger tr_tblemployee_forinsert
	  on tblEmployee
	  for insert 
	  as 
	  begin 
	    declare @id   int
		select @id=id from inserted
		insert into tblEmployeeAudit
		values('new employee with id = '+ CAST(@id as nvarchar(5))+ 'is added at'+ CAST(getdate() as nvarchar(20)))
		 end
-------------------------------------------------------------------------
CREATE TRIGGER tr_tblEMploy_ForInsert
ON tblEmployee
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END
--------
select * from tblEmployee
INSERT INTO [dbo].[tblEmployee]
           ([name]
           ,[gender]
           ,[salary]
           ,[city])
     VALUES
           ('Roshan','Male',90000,'lahore'),('kalim2','male',99000,'bannu')
--------------------------
select * from tblEmployee
select * from tblEmployeeAudit 
-------------------------------------------------------------
CREATE TRIGGER tr_tblEMploy_ForDelete
ON tblEmployee
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + 
 ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
END
----------------
select * from tblEmployeeAudit 
DELETE FROM [dbo].[tblEmployee]
      WHERE id=15;
	  ---check table both 
	  select * from tblEmployee
select * from tblEmployeeAudit 
