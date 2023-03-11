/****** Script for SelectTopNRows command from SSMS  ******/

SELECT TOP (1000) [Employeenumber]
      ,[Employeename]
      ,[Employeecountry]
      ,[cardnumber]
  FROM [databaseaj].[dbo].[Employee] where Employeenumber between 1 and 5
   union
   SELECT TOP (1000) [Employeenumber]
      ,[Employeename]
      ,[Employeecountry]
      ,[cardnumber]
  FROM [databaseaj].[dbo].[Employee] where Employeecountry='pakistan'