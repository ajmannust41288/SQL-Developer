select * from Employee2
select Ascii('A')
select Ascii('Z')
declare @total int
set @total = 65
while (@total <= 90)
begin
 print char(@total)
 set @total=@total+1
end
-----
Declare @Number int
Set @Number = 97
While(@Number <= 122)
Begin
 Print CHAR(@Number)
 Set @Number = @Number + 1
End
-----------upper case letters
Declare @Number1 int
Set @Number1 = 65
While(@Number1 <= 90)
Begin
 Print CHAR(@Number1)
 Set @Number1 = @Number1 + 1
End
-------------------
Declare @Number2 int
Set @Number2 = 65
While(@Number2 <= 90)
Begin
 Print lower(CHAR(@Number2))
 Set @Number2 = @Number2 + 1
End
--------------------
print Ascii('d')
----
select RTRIM('     ajman     ')
select LTRIM('     ajman     ')
--- ---------------sql String Functions 
SELECT 
    ASCII('AB') A, 
    ASCII('Z') Z;
	---print 26 ascii
	WITH cte AS(
    SELECT  
        CHAR(ASCII('A')) [char], 
        1 [count]
    UNION ALL
    SELECT  
        CHAR(ASCII('A') + cte.count) [char], 
        cte.count + 1 [count]
    FROM    
        cte
)
SELECT  
    TOP(26) cte.char
FROM
    cte;

	-----
	with gte 
	as
	(select CHAR(ASCII('C')) [char],
	3 [count]
	union all
	select CHAR(ASCII('A')+gte.count) [char],
	gte.count + 1[count]
	from 
	  gte
	  )
	  select top(24) gte.char
	  from gte
	  ------
	 SELECT 
    CHARINDEX(
        'SERVER', 
        'SQL Server CHARINDEX'
    ) position;
	select * from Employee2
	---case sensitive in charindex
	SELECT 
    CHARINDEX(
        'SERVER', 
        'SQL SERVER CHARINDEX THIS IS THE THINGS WHICH I USED  FOR 
		THE PURPOSE O THIS MATERIALS 
		SERVER  .I THIN THIS IS NOT SERVER' 
        COLLATE Latin1_General_CS_AS
    ) position;
	--Search text 
	declare @haystack varchar(20);
	select @haystack='This is the single man '
	select CHARINDEX('needle',@haystack)
	--- search at positions 
	select CHARINDEX('is','the time is not allowed to enter is hall so we have  is ',8) eight_pos,
	       CHARINDEX('is','the time is not allowed to enter is hall so we have  is ',12) tweleve_pos;
		   --soundex functions 
		   select SOUNDEX('two') two,
		   SOUNDEX('too') too;
---use of differenece func
select DIFFERENCE('two','too')
--
select SOUNDEX('two') two_s,
       SOUNDEX('too') too,
	   DIFFERENCE('two','too') diff_elem;
	   --lets take another examples 
	   SELECT 
    SOUNDEX('Johny') soundex_johny,
    SOUNDEX('John') soundex_john,
    DIFFERENCE('Johny', 'John') similarity;
	--lets take another examples 
	SELECT 
    SOUNDEX('Coffee') soundex_coffee,
    SOUNDEX('Laptop') soundex_laptop,
    DIFFERENCE('Coffee', 'Laptop') similarity;
	---concate functions 
	select 'john'+' '+'khan' as  name;
	--select concat
	select * from Employee
	create table test7(testid int,fname nvarchar(20),lname nvarchar(20))
	insert into test7 values(
	1122,'ajman','khan'),(
	1123,'arif','khan'),(
	1124,'ajm2','khan'),(
	1125,'ajman4','khan'),(
	1126,'ajman5','khan'),(
	1127,'ajman6','khan'),(
	1128,'ajman7','khan'),(
	1129,'ajman8','khan'),(
	1131,'ajman9','khan'),(
	1132,'ajman11','khan')
	select * from test7
	--use o concate functions 
	select testid,fname,lname,
	CONCAT(fname,' ',lname) fullname
	from test7
	order by fullname;
--------concate
SELECT 
   CHAR(13),
        CONCAT(fname,' ',lname) full_name
FROM
    test7
	select * from test7
	---
	select CONCAT_WS(' ','john','Doe') fullname; 
	---
	select fname,lname ,
	CONCAT_WS(',',lname,fname) full_name
	from test7
	order by 
	fname,lname;
	---
	select fname,lname ,
	CONCAT_WS(',',lname,fname) full_name
	from test7
	order by 
	fname,lname;
	---insert null values........ 
	insert into test7 values(
	11324,'','')
	insert into test7 values(
	11334,'','')
	insert into test7 values(
	11354,'','')
	---
	SELECT 
    CONCAT_WS(',', 1, 2, NULL, NULL, 3);
	---
	SELECT 
    CONCAT_WS
    (
        CHAR(13), 
        CONCAT(fname, ' ', lname), 
        CONCAT(lname, ' ', fname) 
    )f_l_l_fname
FROM 
    test7
ORDER BY 
    fname,
	lname;
----
SELECT 
    CONCAT_WS(',', fname, lname, testid)
FROM 
    test7
ORDER BY 
    fname, 
    lname;
	select * from test7
	-----------
	select CHAR(65) char_65,
	     CHAR(90) char_90;
		 ----
SELECT 'Hello,' + char(10) + 
		 'There' AS Result;
		 -- here character 10 is for new line
select LEFT('SQL server',3) result_string;
---lets take another func
select * from tblEmployee
