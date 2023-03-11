create table Tablelog
(
logid int  primary key,
Eventval xml not null,
Eventdate datetime not null,
changedBody sys not null
);
-----------------
select * from EMP11