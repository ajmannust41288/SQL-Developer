SELECT * FROM sales;
SELECT ROW_NUMBER() OVER ( ORDER BY CustomerName) as ordernumber,
 ROW_NUMBER() OVER (PARTITION by VenderName ORDER BY VenderName) as Vender_number,
 dense_RANK() OVER ( ORDER BY CustomerName) as customernumber,
CustomerName,ProductName,Amount,VenderName FROM
Sales;
INSERT INTO sales VALUES ('Sharma','book',3000,'Batta');
--This is For the Highest salary 
SELECT max(amount) FROM sales;
--list of slaraies which are less than  Highest salary
SELECT  amount FROM sales WHERE
amount < (SELECT MAX(amount) from sales);
--Second highest salary
SELECT  max(amount) FROM sales WHERE
amount < (SELECT MAX(amount) from sales);
SELECT DISTINCT top 2 amount from sales 
order by amount desc;
