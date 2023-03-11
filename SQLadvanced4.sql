select * from Person
-- add check constraints 
alter table person 
add constraint ck_person_age check(age>0 and age<150)
-- Drop contraints 
alter table person 
drop constraint ck_person_age
--Task 1 SQL advanced --------------------
create table tblperson(id int primary key,name nvarchar(50),age int null)
alter table tblperson
add constraint ck_tblperson_age check(age>0 and age<70)
insert into tblperson values(1,'ajman',34)
insert into tblperson values(2,'ajmal',35),(3,'waqar',36),(4,'zubair',45)
--check id primary key 
insert into tblperson values(2,'ajmal',35)
--check age greater than 70
insert into tblperson values(5,'ajmal',75)
-- task2------------------------------------------sql server part7-------------
create table person2(personid int identity(1,1),name nvarchar(50))
insert into person2 values ('ajman'),('kalim'),('noman'),
('ajman2'),('kalim2'),('noman2'),('ajman3'),('kalim3'),('noman3'),
('ajman4'),('kalim4'),('noman4'),('ajman5'),('kalim5'),('noman5')
--check identity personid--
insert into person2 values (16,'ajman6')
--check table insertion
select * from person2
--set identity insert on 
set identity_insert person2 on
insert into person2(personid,name) values (16,'ajman6')
--check row 
select * from person2
--check again without personid insert
insert into person2(name) values ('ajman7')
--off insert personid
set identity_insert person2 off
--again check insert without personid
insert into person2(name) values ('ajman7')
select * from person2
--create table and idenetity 
create table Person3
(
Id int Identity(1,5),
Name varchar(20)
)
--insert values to person 3 
insert into person3 values ('ajman1'),('ajman2')
,('kalim2'),
('noman2'),('ajman3'),('kalim3'),('noman3'),
('ajman4'),('kalim4'),('noman4'),
('ajman5'),('kalim5'),('noman5')
--check table person3 
select * from person3
--drop column 
alter table person3
drop column name
--add identity again 
DBCC CHECKIDENT('Person3', RESEED)
--add column
alter table person3
add id int identity(5,1)
--insert again
insert into person3 values ('ajman1'),('ajman2')
,('kalim2'),
('noman2'),('ajman3'),('kalim3'),('noman3'),
('ajman4'),('kalim4'),('noman4'),
('ajman5'),('kalim5'),('noman5')
--check table person3
select * from  person3
--------------------------SQL Part 8 tasks -----------
create table test1
(
id int identity(1,1),
value nvarchar(20)
)
create table test2
(
id int identity(1,1),
value nvarchar(20)
)
--insert values
insert into test1 values('x')
insert into test1 values('x')
insert into test1 values('x')
insert into test1 values('x')
select * from test1
--last identity column
select SCOPE_IDENTITY()
select @@IDENTITY
--Create a Trigger on test1
create Trigger trforinsert on test1 for insert
as 
Begin
insert into test2 values('yyy')
End
--lets check both tables test1 and test2 
select * from test1
select * from test2
--insert rows
insert into test1 values('y')
--lets execute 
select SCOPE_IDENTITY()
select @@IDENTITY
--check tables
select * from test1
select * from test2
--check identity_current
--user1 session
insert into test2 values('zzz')
--lests check all
select SCOPE_IDENTITY()
select @@IDENTITY
select IDENT_CURRENT('test2')