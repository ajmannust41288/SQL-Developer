/****** Script for SelectTopNRows command from SSMS  ******/
use AdventureWorks2012
go
select * from HumanResources.EmployeeDepartmentHistory
select COUNT(HumanResources.EmployeeDepartmentHistory.BusinessEntityID),HumanResources.EmployeeDepartmentHistory.ShiftID
from HumanResources.EmployeeDepartmentHistory
group by HumanResources.EmployeeDepartmentHistory.ShiftID 
order by COUNT(HumanResources.EmployeeDepartmentHistory.BusinessEntityID) ;
