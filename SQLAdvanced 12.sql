select * from TableEmployer
select * from tblEmployee2
-- lets check tblEmployee2(Departmentid) which is 
--child table and Tableemployeer is parent table(id)
insert into tblEmployee2 values(9,'kalim2',69000,'Male',8),
(10,'kalim3',87000,'Male',9),(11,'kalim4',97000,'Male',10),
(12,'kalim5',77000,'Male',11),(13,'kalim6',99000,'Male',12)
select * from TableEmployer
select * from tblEmployee2
----how to drop fk
ALTER TABLE TableEmployer
DROP CONSTRAINT FK_TableEmployer_tblEmployee2;
----foreign key 
CREATE TABLE Employee3(
EmployeeID int IDENTITY (1,1) NOT NULL,
FirstName nvarchar (50) NOT NULL,
LastName nvarchar (50) NOT NULL,
DepartmentID int NULL, 
CONSTRAINT PK_EmployeeID PRIMARY KEY (EmployeeID), 
CONSTRAINT FK_Employee_Department FOREIGN KEY (Departmentid)
REFERENCES tblEmployee2 (DepartmentID)
ON DELETE CASCADE
ON UPDATE CASCADE)
---
select * from TableDepartament
insert into TableDepartament values('Computer','EME','Usaman akram'),
('EE','EME','Zubair khan'),('Computer','EME','Usaman akram'),
('mechatronics','EME','Noman khalid'),('Computer','EME','Usaman akram'),
('Computer','EME','Usaman akram'),('Computer','EME','Usaman akram')
select * from TableDepartament
--  foreign key 
Create table tblEmployee4(Employeeid int identity(1,1) not null,
Firstname nvarchar(20) not null ,Lname nvarchar(20) not null,
Departmentid int null,
constraint PK_Employeeid primary key (Employeeid),
constraint Fk_Employee4_TableDepartament foreign key (Departmentid)
references TableDepartament(ID)
on delete cascade
on update cascade)
---- insert values 
insert into tblEmployee4 values('ajman','khan',8),
('ajman2','khan',2),('ajman3','khan',3),
('ajman4','khan',4),('ajman5','khan',5),
('ajman6','khan',6),('ajman7','khan',7),
('ajman8','khan',8),('ajman9','khan',9)