Use [TT855-2/1 Anushik Tatoyan]
--3_1
SELECT orders.id_ord,orders.sum_ord,orders.date_ord
FROM Orders
--3_2
SELECT customers.*
FROM Customers
WHERE customers.id_cust=8
--3_3
SELECT DISTINCT orders.id_sel
FROM Orders
--3_4
SELECT customers.*
FROM Customers
WHERE customers.rating_cust<=60 and customers.city_cust!='Yerevan'
--3_5/1
SELECT orders.*
FROM Orders
WHERE DatePart(month,date_ord)=12 or DatePart(month,date_ord)=10 and DatePart(year,date_ord)=2012
--3_5/2
SELECT orders.*
FROM Orders
WHERE month(date_ord)=12 or month(date_ord)=10 and year(date_ord)=2012
--3_6
SELECT customers.id_cust,customers.lname_cust,customers.rating_cust
FROM Customers
ORDER BY customers.rating_cust DESC
