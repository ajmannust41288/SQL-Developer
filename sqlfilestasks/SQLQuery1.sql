USE [AdventureWorks2012]
GO

select * from   Production.UnitMeasure
-- example of Update 
update Production.UnitMeasure
set Name='Square Footage'
where Production.UnitMeasure.UnitMeasureCode='FT2'
-- example of delete 
delete from Production.UnitMeasure
where Production.UnitMeasure.UnitMeasureCode='FT'

-- Example of Trigger 
create trigger insertsuccess
on Production.UnitMeasure
after update
as raiserror ('UnitMeasure successfully added',16,10);




    
GO


