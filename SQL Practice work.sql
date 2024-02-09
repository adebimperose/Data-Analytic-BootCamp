---- Creating Database Bootcam
CREATE DATABASE BootCamp;

---to view Livestock_Table
SELECT*
FROM dbo.[Livestock Table]
----type Select*, enter and type From dbo.livestock enter and it displap the table on the low part of the sheet.

---inserrting values into the table

INSERT INTO dbo.[Livestock Table]
VALUES (01, 'Cattle',  200000, 100000, 250000),
(02, 'Sheep', 150000, 750000,1500000),
(03, 'Pigs', 27000, 135000,10000),
(04, 'Goat', 40000, 20000, 40000),
(05, 'Horses', 550000, 275000, 55000);


ALTER TABLE dbo.[Livestock Table]
--ALTER COLUMN Unitprice money;
--ALTER COLUMN cost money;
ALTER COLUMN profit money;

-----Inserting Values Customer Table 
INSERT INTO dbo.[Customer Table]
VALUES('Ahmed Johson', 10, 5,'Abuja Nigeria',2),
('Rose Adeboye', 15, 3,'Akure Nigeria', 1),
('Jennifer Okoro', 20, 15,'Anambra America', 5),
('Caleb Oya', 25, 10, 'WUSE America', 4);

SELECT*
FROM dbo.[Customer Table]

----To create Delivery Table. click on table select new and type in all tjhe data
ALTER TABLE dbo.DeliveryTable
ALTER COLUMN Contact varchar(50)


INSERT INTO dbo.DeliveryTable
VALUES(1, 'DHL', '(234)701-529-3314', 18),
(2,'GIG', '(234)701-239-2214', 20),
(3, 'GUO' , '(234)701-456-2217', 15);

SELECT*
FROM dbo.DeliveryTable
SELECT*
FROM dbo.[Customer Table]
SELECT*
FROM dbo.[Livestock Table]

--Analysis 
--- Total quantity 
select SUM (quantity) AS TotalQuantity
From [Customer Table]

---to store the result as a table we used the "into" commmand
select SUM (quantity) AS TotalQuantity
into TotalQuantity
From [Customer Table]

SELECT*
FROM TotalQuantity

--AVG UNIT PRICE
Select AVG (Unitprice) As AverageUnit
Into AverageUnit
From [Livestock Table];

--Total cost
Select Sum (cost) As TotalCost
---into SumofCost
From [Livestock Table];
--- sum of total cost of livestock

--Total profit
Select sum (profit) As Totalprofit
Into Totalprofit
From [Livestock Table];
--- Total profit from livestock

---Minimum Unitprice
Select min(unitprice) As MinimumUnitprice
into MinimumUnitprice
From [Livestock Table];
--- Mimnimum unit price

---Maximum Cost
Select max(cost) As MaximumCost
Into MaximumCost
From [Livestock Table];
---maximum cost of livestock

---Maximum Profit
Select max(profit) As Maximumprofit
---Into MAximumprofit
From [Livestock Table];
--- maximum profit of livestock

---Customer Quantity
Select Customernames, quantity, customerid
into CusomeerPerQuantity
From [Customer Table]
Where Quantity >=5
--- customernames, quantity and costomer identity

Select Livestockname, Unitprice
Into LivestockUnitPrice
From [Livestock Table]
Where UnitPrice > 40000
--- livestockname and Unitprice of livestock greater than 40000

Select Livestockname, Unitprice, Cost
From [Livestock Table]
Where UnitPrice > 20000 And Cost > 150000
---livewstockname, unitprice and cost of livestock where unitprice is greater 20000 and cost greater than 150000

Select LivestockIdentity, PRofit
From [Livestock Table]
WHere profit < 20000
--- profit of livestock greater than 20000

Select LivestockIdentity, PRofit, cost
From [Livestock Table]
WHere profit > 20000 and cost < 200000
--- profit of livestock greater than 20000 and cost is 200000

Select Unitprice, PRofit 
From [Livestock Table]
WHere unitprice > 20000 and cost < 100000
---unit price less than 20000 and cost less than 10000

Select Customernames, Sum(cost) As TotalCost
From [Customer Table]
Join [Livestock Table] ON [Customer Table].Livestockid = [Livestock Table].LivestockIdentity
Group by CustomerNAmes
Order by Customernames ---DESC;
--- Total cost of livestock table on customertable with livestock id which gives livestock table with the identity.


Select CustomerNames, Sum(profit) As Totalprofit
From [Customer Table]
Join [Livestock Table] ON [Customer Table].Livestockid = [Livestock Table].LivestockIdentity
Group by CustomerNAmes
Order by Customernames ---DESC;
--- total Profit of livestock table on customertable with livestock id which gives livestock table with the identity.


Select CustomerNames, Avg(cost) As Averagecost
From [Customer Table]
Join [Livestock Table] ON [Customer Table].Livestockid = [Livestock Table].LivestockIdentity
Group by CustomerNAmes
Order by Customernames ---DESC;
--- Average cost livestock table on customertable with livestock id which gives livestock table with the identity.

Select Current_Timestamp As CurrentDateTime;

--- ANALYSIS FOR SALES FROM INVOICEDATA
Select sum (sales) As TotalSales From dbo.InvoiceData  ---Total sales of invoice data
Select Min(sales) As MinimumSAles From dbo.InvoiceData--- Minimum Sales of Invoice
Select Max(sales) As MAximumSales From dbo.InvoiceData--- Maximum Sales of Invoice
Select AVG(sales) As AverageSales From dbo.InvoiceData--- Average Sales of Invoice
Select Count(sales)As CountofSAles From dbo.InvoiceData---Count of Sales of Invoice

select*From dbo.InvoiceData
Where Sales >=1000 --- Sales Greater than 1000 from invoiceData
Select Customercode, Date, Quantity
From dbo.InvoiceData
--- sales greater than 1000 and quantity 

select * From dbo.CustomerData
Select * From dbo.InvoiceData

Select InvoicelineId, quantity, PackagetypeId
From dbo.InvoiceData
Where Sales > 20000
---  Sales greaterthan

Select InvoicelineId, quantity, PackagetypeId
From dbo.InvoiceData
Where Sales < 20000
--- Sales less than 20000

Select CustomerCode, Max(sales) As Maxsales
From dbo.InvoiceData
Group By CustomerCode
Having Max(sales) > 15000
--- example for using groupby with having. in CustomerCategoryName this brings all the cutomercodes together.

Select CustomerCode, sales
From dbo.InvoiceData
Where Sales > 15000
---- using only where syntax. in CustomerCategoryName this display all the customercode

---ANALYSIS FOR QUANTITY FROM INVOICEDATA
Select sum (quantity) As SumQuantity From dbo.InvoiceData  ---Total sales of invoice data
Select Min(quantity) As SumQuantity From dbo.InvoiceData  --- Minimum Sales of Invoice
Select Max(quantity) As MaximumQuantity From dbo.InvoiceData  ---Maximum Sales of Invoice
Select AVG(quantity) As AverageQuantity From dbo.InvoiceData --- Average Sales of Invoice
Select Count(quantity) As CountOfQuantity From dbo.InvoiceData ---Count of Sales of Invoice

Select * From dbo.InvoiceData 
Where Quantity >= 100;
--- qunatity greater than 100

Select * From dbo.InvoiceData
Where Sales between 500 and 10000
--- Where Sales is between 500 and 10000
Select *From dbo.InvoiceData
Where Quantity between 50 and 1000

Select Sum(TotalDryItems) AS TotalDryItems From dbo.InvoiceData
--- total sum of dry items

Select Sum(TotalChillerItems) As TotalChillerItems From dbo.InvoiceData
---total sum of chiller items

Select Distinct(PackagetypeId) As PackageTypeId
From dbo.InvoiceData
--- to know the number of disctint number in packageTypeId

Select Distinct(PackagetypeId) As PackageTypeId, count(PackageTypeId) As CountPackageTypeId
From dbo.InvoiceData
Group By PackageTypeId 
Order By  PAckageTypeId DESC;
--- to know the number of disctint number in eacg group in packageTypeId

Select year(date) As Year, Sum(quantity) As TotalQuantity,  Sum(Sales) As TotalSales
From dbo.InvoiceData
Group By Year(Date)
Order By Year
--- Sum of Quantity and Sales


Select year(date) As Year, Avg(quantity) As AverageQuantity, Avg(Sales) As AverageSales
From dbo.InvoiceData
Group By Year(Date)
Order By Year
--- Average of quantity and Sales.

---JOIN THIS IS USE TO JOIN TWO TABLES TOGETHER IN ONE TABLE

SELECT d.CustomerName As CustomerName,
       Sum(i.Sales) AS TotalSales,
	   Sum(i.Quantity) As TotalQuantity
FROM dbo.InvoiceData i
JOIN dbo.CustomerData d ON i.CustomerCode = d.CustomerID
GROUP BY d.CustomerName
ORDER BY Sum(i.Sales) DESC;
--- JOINING TWO TALES TO SEE TOTAL SALES AND QUANTITY BY CUSTOMERNAMES order by sales

SELECT d.CustomerName As CustomerName,
       Sum(i.Sales) AS TotalSales,
	   Sum(i.Quantity) As TotalQuantity
INTO JoiningSalesandQuantityByCustomerNAme
FROM dbo.InvoiceData i
JOIN dbo.CustomerData d ON i.CustomerCode = d.CustomerID
GROUP BY d.CustomerName
ORDER BY Sum(i.quantity) DESC;
--- JOINING TWO TABLES TO SEE TOTAL SALES AND QUANTITY BY CUSTOMERNAMES odering by quanity


SELECT C.City AS City,
       Sum(i.Sales) AS TotalSales,
	   Sum(i.Quantity) As TotalQuantity
INTO JoiningSalesandQuantityByCity
FROM dbo.InvoiceData i
JOIN dbo.CustomerData C ON i.CustomerCode = c.CustomerID
GROUP BY City
ORDER BY Sum(i.quantity) DESC;
---totalsales and total quantity by city

SELECT C.Province AS Province,
       Sum(i.Sales) AS TotalSales,
	   Sum(i.Quantity) As TotalQuantity
INTO JoiningSalesandQuantityByProvince
FROM dbo.InvoiceData i
JOIN dbo.CustomerData c  ON i.CustomerCode = C.CustomerID
GROUP BY Province
ORDER BY Sum(i.quantity) DESC;
---totalsales and total quantity by province

SELECT C.CustomerCategoryNAme AS CusomerCategoryGroup,
       Sum(i.Sales) AS TotalSales
INTO JoiningSalesandCUstomerCategoryGroup
FROM dbo.InvoiceData i
JOIN dbo.CustomerData c  ON i.CustomerCode = C.CustomerID
GROUP BY CustomerCategoryName
ORDER BY Sum(i.Sales) DESC;
---total sales and joing of customercategoryname together


SELECT  C.CustomerCategoryNAme AS CusomerCategoryGroup,
       Sum(i.quantity) AS TotalQuantity
INTO JoiningSalesandCustomerCategoryName
FROM dbo.InvoiceData i
JOIN dbo.CustomerData c  ON i.CustomerCode = C.CustomerID
GROUP BY CustomerCategoryName
ORDER BY Sum(i.quantity) DESC;
---total quantity and joing of customercategoryname together

SELECT Top 10 *  
From dbo.CustomerData
---- to check for first top number of item it can be above 10

--- IS NULL AND IS NOT NULL FOR INVOICE DATA
SELECT *
FROM  dbo.InvoiceData
WHERE InvoiceLineID IS NULL
--- this is used to check if there is empty space


SELECT *
FROM  dbo.InvoiceData
WHERE InvoiceLineID IS NOT NULL
---- this is used to check if there is no empty space

--- IS NULL AND IS NOT NULL FOR CUSTOMER DATA
SELECT *
FROM  dbo.CustomerData
WHERE CustomerID IS NULL
---this is used to check if there is empty space
SELECT *
FROM  dbo.CustomerData
WHERE CustomerID IS NOT NULL
---- this is used to check if there is no empty space

----UNION
SELECT CustomerName 
From dbo.CustomerData
UNION
SELECT CustomerNames
From [Customer Table]
--- WE DONT UNION NUMBERS WITH ALPHABET

SELECT CustomerName 
From dbo.CustomerData
UNION ALL
SELECT CustomerNames
From [Customer Table]



SELECT CustomerID
From dbo.CustomerData
UNION 
SELECT CustomerCode
From dbo.InvoiceData

SELECT CustomerID
From dbo.CustomerData
UNION ALL
SELECT CustomerCode
From dbo.InvoiceData

---Cte
WITH NoveltyShop As (
                SELECT CustomerName, CustomerCategoryName
				From dbo.CustomerData
				Where CustomerCategoryName = 'Novelty Shop'
)
Select * 
From NoveltyShop;


WITH GiftStore As (
                SELECT CustomerName, CustomerCategoryName
				From dbo.CustomerData
				Where CustomerCategoryName = 'GiftStore'

)
Select * 
---INTO GiftStore
From GiftStore
---- select only giftstore using CTE

WITH SuperMarket As (
                SELECT CustomerName, CustomerCategoryName
				From dbo.CustomerData
				Where CustomerCategoryName = 'SuperMarket'
)
Select * 
---Into SuperMarket
From Supermarket
---Wwith is used to brings out specified group of data

SELECT CustomerCode, Quantity
FROM dbo.InvoiceData
WHERE CustomerCode Like '_2' and Quantity Like '_0_'
---- this is where customercodethaoth 2 and quantity ends with 0

SELECT Customername, City
FROM  dbo.CustomerData
WHERE City Like '_Jessie_' or CustomerName  Like '%e_'
----where customername start with e or city name that ends with e

SELECT Customername, Province
FROM  dbo.CustomerData
WHERE City Like '_%Nebreka_' or CustomerName Like '%e_' 
--- where customername start with a and province name that ends with e

SELECT CustomerName, City
FROM  dbo.CustomerData
WHERE CustomerName Like '%a' or City  Like 'a%'
--- where customername start with A and City that ends with A

SELECT CustomerGroup 
FROM  dbo.CustomerData
WHERE CustomerGroup Like '%y' or CustomerGroup  Like 'w%'
---customergroup that ends with y or start with w

SELECT PrimaryContact, City
FROM  dbo.CustomerData
WHERE PrimaryContact Like 'J%' or City  Like '%_n'
--- primary contact that starts with J or city that ends with _n

SELECT TransactionID, Sales
FROM  dbo.InvoiceData
WHERE TransactionID Like '_0%' and Sales  Like '%0'
--- InvoiceDAta where Transactionid with zero as second number and Sales that ends with zero


---IN SQL The IN operator is used to specify multiple values in a WHERE Clause.
--- It allows you to Filter results based on whether a specified value matches any values in a subquery or a list of values

SELECT CustomerID, CustomerName
FROM  dbo.CustomerData 
WHERE CustomerID IN ( 1,2,3,4,8,10,100,.7,9,156)
--- this display the specified number we want to see from a database

SELECT CustomerCode, TransactionID
FROM dbo.InvoiceData
WHERE CustomerCode IN ( 3,5,6,66,90,80)