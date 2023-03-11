select * from Person.BusinessEntity
select * from Person.PersonPhone
select * from Person.Password
-- lets execute proc 
sp_helptext uspGetBillOfMaterials 4235,'2017-11-06 19:50:03.020'
sp_help  uspGetBillOfMaterials
select * from Person.Address
SELECT 
    CONCAT(
        CHAR(13),
        CONCAT(City,' ',AddressLine1),
        char(20),
        AddressID,
        CHAR(13),
        CONCAT(city,' ',StateProvinceID),
        CHAR(13),
        PostalCode
    ) customer_address
FROM
    Person.Address
	---product name 
	select * from Production.Product
	select Name,
	LEFT(Name,7) first_7character
	from Production.Product
	order by Name;
	----
	SELECT
	LEFT(Name, 1) initial,  
	COUNT(Name) product_count
FROM 
	Production.Product
GROUP BY
	left(Name, 1)
ORDER BY 
	initial;
	-- 
	select * from Sales.PersonCreditCard
	select * from Sales.SalesOrderDetail