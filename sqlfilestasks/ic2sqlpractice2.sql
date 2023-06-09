--highest slaray from the table 
--SELECT * FROM emp4 where esal=(SELECT max(esal) FROM emp4)
--Second highest salary
--SELECT * FROM emp4 where esal=(SELECT max(esal) FROM emp4 where esal<(select max(esal) from emp4))
--display all data whose ename satrt letter is a
--SELECT * FROM emp4 WHERE ename like 'a%'
--To get data more than one esal ,use in operator
--SELECT * FROM emp4 where esal in(2500,2900,3600);
--how to create a table from existing table 
--create table emp5 as SELECT * FROM emp4;
--SELECT * FROM emp4;
--slect salary btw 2500 and 3000
--SELECT * FROM emp5 where esal BETWEEN 2500 and 3000;
--how to delete more than two records 
--DELETE from emp5 where eid in(5,7,8);
--TCL Commands 
--SELECT * FROM emp5;
--INSERT INTO emp5 VALUES (7,'jabar','domail',3800,'08-feb-22')
--SELECT * FROM emp5;
--SAVEPOINT A;
--INSERT INTO emp5 VALUES (15,'Anam','FK',4100,'09-feb-22');
--SAVEPOINT B;
--INSERT INTO emp5 VALUES (13,'akit','karak',2400,'02-jan-22');
--SAVEPOINT C;
--ROLLBACK TO SAVEPOINT C;
--ROLLBACK TO SAVEPOINT B;
--ROLLBACK TO SAVEPOINT A;
--SELECT * FROM emp5;
--update emp5 set esal=esal+500 where eid=11;
--update emp5 set esal=esal*3 where eid=10;
--update emp5 set ename=ename || 'Roy' where eid=3;
--SELECT * FROM emp5 WHERE eid>=5 and doj='04-jan-22';
--SELECT DISTINCT *  FROM emp5;
--SELECT all * FROM emp5;
--SELECT UNIQUE *  FROM emp5;
--use of in operator
--SELECT * FROM emp5 where eid in(9,11,13);
--SELECT * FROM emp5 where eid not in(9,11,13);
--SELECT * FROM emp5 where ename like '_j%';
--SELECT * FROM emp5 where ename like '_k%';
--SELECT * FROM emp5 where ename like '%n';
--SELECT * FROM emp5 where ename not like '%n';
--SELECT * FROM emp6;
--INSERT INTO emp6 VALUES (12,'Aman',9900);
--use of set operator 
--union operator use 
--SELECT * FROM emp5 UNION SELECT * FROM emp4;
--SELECT * FROM emp4;
--SELECT * FROM emp5;
--ALTER table emp5 add country VARCHAR(20);
--update emp5 set country='India' where eid in(3,13);
--how to union of not same number of columns
--SELECT eid,ename,eadd,esal,doj,NULL as country from emp4 UNION SELECT * FROM emp5;
--Create table from existing table 
--create TABLE emp7 as SELECT * FROM emp5;
SELECT * FROM emp7;
--To drop columns from a table 
--ALTER TABLE emp5 DROP COLUMN country;
--union all operator vwill also show duplicates and not sort in asc
--SELECT * FROM emp4 UNION ALL SELECT * FROM emp5;
-- use of intersect operator will show common of all 
--SELECT * FROM emp4 INTERSECT SELECT * FROM emp5;
--use of minus operator will minus the common from first to second and show first table
--SELECT * FROM emp4 MINUS SELECT * FROM emp5;
--sql alias is temperoary name for column or table
--SELECT eadd as address from emp7;
--for table alias we have 
--select ename,eadd from emp5 s,emp4  t where s.eid=t.eid; 
--Constraints are business rule which allow us to enter proper data in a table
--in oracle the integrity constraints are divided into 3 gropus
--Domain integrity constraints(default,not null,check),inteity constraints(unique key,primary key)and Referential integrity constraints
--create TABLE emp8(eid number,ename VARCHAR(10),esal number DEFAULT 3000);
--INSERT INTO emp8(eid,ename) VALUES (10,'ankit');
--INSERT INTO emp8(eid,ename) VALUES (50,'Mahir');
--SELECT * FROM emp8;
--INSERT INTO emp8(ename) VALUES ('Numan');
-- how to modifiy constraints
--ALTER TABLE emp8 MODIFY eid DEFAULT 5;
--INSERT INTO emp8(ename) VALUES ('Waqare');
--INSERT INTO emp8(ename) VALUES ('Numan2');
--INSERT INTO emp8(ename) VALUES ('ajman2');
--INSERT INTO emp8(ename) VALUES ('ajman3');
--INSERT INTO emp8(ename) VALUES ('ajman4');
--CREATE TABLE emp9(eid number,ename varchar(10),esal NUMBER);
--INSERT INTO emp9 VALUES (1,'ajman',2000);
--INSERT INTO emp9(ename,esal) VALUES ('waqas4',2600);
--INSERT INTO emp9(ename,esal) VALUES ('ajman3',2700);
--SELECT * FROM emp9;
-- we cannot modify eid not null beacuse it is already have null values
--ALTER TABLE emp9 MODIFY eid not null ;
--ALTER TABLE emp9 drop COLUMN eid;
--desc emp9;
--ALTER TABLE emp9 add eid number ;
-- check value only allows selected values 
--CREATE TABLE student(eid number check(eid in (10,20,30)),ename varchar(10),esal NUMBER );
--insert into student values(10,'ajman',2000);
--insert into student values(20,'ajmal',3000);
--insert into student values(40,'waqas',2500);
--check constraint (SYSTEM.SYS_C007010) violated above will shows this 
--select * from student;
--to show you how we can check table constraints
--CREATE TABLE student2(eid number ,ename varchar(10),esal NUMBER,check(ename in ('ajman','irfan','akram' )));
--insert into student2 values(10,'ajman',2000);
--insert into student2 values(40,'kalim',6000);
--insert into student2 values(40,'kalim',6000)
--ORA-02290: check constraint (SYSTEM.SYS_C007011) violated
--select * from student2;
--CREATE TABLE student3(sroll number unique,sname varchar(20),saddress varchar(20));
--insert into student3 values(10,'ajman',2000);
--insert into student3 values(11,'ajman6',2400)
--Error report -
--ORA-00001: unique constraint (SYSTEM.SYS_C007020) violated
--insert into student3 values(10,'ajman6',2400);
--select * from student3;
--update student3 set saddress='Bannu' where sroll in(10,11,12);
--CREATE TABLE student4(sroll number primary key,sname varchar(10),saddress varchar(10));
--insert into student4 values(1,'ajman','kpk');
--insert into student4 values(2,'ajmal','kpk2');
--desc student4;
--insert into student4 values(2,'ajmal2','kpk2');
--nsert into student4 values(2,'ajmal2','kpk2')
--Error report -
--ORA-00001: unique constraint (SYSTEM.SYS_C007021) violated
--select * from student4;
--drop table  student4;
--desc student4;
--How to use composite keys 
--CREATE TABLE student4(sroll number ,sname varchar(10),saddress varchar(10),unique(sroll,sname));
--alter table student4 add primary key(saddress);
--insert into student4 values(1,'ajman','kpk');
--insert into student4 values(2,'ajmal','bannu');
--desc student4;
--insert into student4 values(3,'waqar','karak');
--select * from student4;
--insert into student4 values(3,'waqar','karak');
--Error starting at line : 135 in command -
--insert into student4 values(3,'waqar','karak')
--Error report -
--ORA-00001: unique constraint (SYSTEM.SYS_C007022) viol
