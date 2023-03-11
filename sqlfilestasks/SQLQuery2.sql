/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [carnumber]
      ,[color]
      ,[Datepurchased]
  FROM [databaseaj].[dbo].[cars] where  carnumber between 7 and 14
  intersect
  SELECT TOP (1000) [carnumber]
      ,[color]
      ,[Datepurchased]
  FROM [databaseaj].[dbo].[cars] where  color='green'