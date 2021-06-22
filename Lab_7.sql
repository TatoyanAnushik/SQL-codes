--7_1
Select sellers.name_sel,sellers.city_sel
From Sellers
UNION ALL
Select customers.name_cust,customers.city_cust
From Customers
--7_2
Select sellers.city_sel as city
From Sellers
Union all
Select customers.city_cust as city
From Customers
Order by city desc
--7_3
--Select * into Sells_2016 from Sells_2015
--Select * into Sells_2017 from Sells_2015
--7_5
SELECT products.name,sells_2015.id_sel,sells_2015.[count]
FROM Products
JOIN Sells_2015
ON products.prod_id=Sells_2015.prod_id
UNION 
SELECT products.name,sells_2016.id_sel,sells_2016.[count]
FROM Products
JOIN Sells_2016
ON products.prod_id=Sells_2016.prod_id
UNION 
SELECT products.name,sells_2017.id_sel,sells_2017.[count]
FROM Products
JOIN Sells_2017
ON products.prod_id=Sells_2017.prod_id
ORDER BY [count] ASC
--7_6
SELECT sells_2016.[count],year(sel_date) AS 'Year'
FROM Sells_2016
UNION 
SELECT  sells_2017.[count], year(sel_date) AS 'Year'
FROM Sells_2017
ORDER BY 'Year' DESC
--7_7
SELECT MAX(sells_2015.[count]) AS 'Max',year(sells_2015.sel_date)
FROM sells_2015
GROUP BY year(sells_2015.sel_date)
UNION
SELECT MAX(sells_2016.[count]) AS 'Max',year(sells_2016.sel_date)
FROM sells_2016
GROUP BY year(sells_2016.sel_date)
UNION
SELECT MAX(sells_2017.[count]) AS 'Max',year(sells_2017.sel_date)
FROM sells_2017
GROUP BY year(sells_2017.sel_date)
--7_8
SELECT products.name,sells_2015.prod_id
FROM Products
JOIN Sells_2015
ON products.prod_id=sells_2015.prod_id
EXCEPT
SELECT products.name,sells_2016.prod_id
FROM Products
JOIN Sells_2016
ON products.prod_id=sells_2016.prod_id
--7_9
SELECT products.name,sells_2015.prod_id
FROM Products
JOIN Sells_2015
ON products.prod_id=sells_2015.prod_id
INTERSECT
SELECT products.name,sells_2016.prod_id
FROM Products
JOIN Sells_2016
ON products.prod_id=sells_2016.prod_id
INTERSECT
SELECT products.name,sells_2017.prod_id
FROM Products
JOIN Sells_2017
ON products.prod_id=sells_2017.prod_id
--7_10
SELECT name,lastname,year,sum(sum_bonus) AS total
FROM test_table_pivot
GROUP BY name,lastname,year

SELECT name,lastname,[2017],[2018],[2019],[2020]
FROM 
(
SELECT name,lastname,sum_bonus,[year] FROM test_table_pivot
) AS new_t
PIVOT(SUM(sum_bonus) FOR [year] IN ([2017],[2018],[2019],[2020]))
AS test

SELECT product_name,stocks,quantity
FROM Product_stock
UNPIVOT(quantity FOR stocks IN (stock1,stock2,
stock3,stock4)) AS new_unpivot
ORDER BY stocks

--7_11
Select * into TOTAL_SELLS from Sells_2015
INSERT INTO TOTAL_SELLS VALUES(6,2,1,'2016-02-12'),(7,3,2,'2016-02-26'),(8,4,1,'2016-04-12'),
(9,5,2,'2016-06-20'),(10,8,4,'2016-09-23')
INSERT INTO TOTAL_SELLS VALUES(11,1,1,'2017-04-02'),(12,4,1,'2017-05-14'),(13,5,1,'2017-07-02'),
(14,7,5,'2017-09-30')

SELECT prod_id,[2015],[2016],[2017]
FROM 
(
Select prod_id , [count],sel_date 
FROM TOTAL_SELLS
)as test1
pivot
(
 sum([count]) FOR sel_date in ([2015],[2016],[2017]))
as new_test

--select * into new_total from TOTAL_SELLS

SELECT prod_id,[2015],[2016],[2017]
FROM 
(
Select prod_id , [count],year(sel_date) as [year]
FROM new_total
)as test1
pivot
(
 sum([count]) FOR [year] in ([2015],[2016],[2017]))
as new_test