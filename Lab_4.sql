--4_1
SELECT MAX(customers.rating_cust),customers.city_cust
FROM Customers
GROUP BY customers.city_cust
--4_2
SELECT Avg(orders.id_sel),year(orders.date_ord)
FROM Orders
GROUP BY year(orders.date_ord)
--4_3
SELECT customers.lname_cust,customers.rating_cust
FROM Customers
WHERE customers.city_cust='Yerevan'
--4_4
SELECT sellers.*
FROM Sellers
WHERE Left(name_sel,1)='M'
--4_5
SELECT customers.*
FROM Customers
WHERE Right(customers.lname_cust,3)='yan'
--4_6
SELECT sellers.*
FROM Sellers
WHERE sellers.name_sel=Reverse(sellers.name_sel)
--4_7
SELECT Min(price*quantity),goods.id_cust
FROM Goods
GROUP BY goods.id_cust