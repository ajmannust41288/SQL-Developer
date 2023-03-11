/****** Script for SelectTopNRows command from SSMS  ******/
SELECT count (distinct SalesOrderID) as uniqueorders,
      avg(UnitPrice) as avg_unitprice,
	  MIN(OrderQty) as Min_orderquantity,
	  MAX(LineTotal) as Max_LineTotal

  FROM [AdventureWorks2012].[Sales].[SalesOrderDetail]