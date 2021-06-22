--6_1
SELECT sellers.name_sel,sellers.city_sel,orders.sum_ord
FROM Sellers
JOIN Orders
ON orders.id_sel=sellers.id_sel
WHERE orders.sum_ord<=55000
Order by sum_ord desc
--6_2
SELECT sellers.lname_sel,sellers.leader,orders.sum_ord
FROM Sellers
join Orders 
on sellers.id_sel=orders.id_sel
--6_3
SELECT Customers.name_cust,Customers.rating_cust,orders.sum_ord
FROM Customers
join Orders 
on Customers.id_cust=orders.id_cust
--6_4
SELECT Sellers.id_sel,Sellers.lname_sel,orders.date_ord
FROM Sellers
join Orders 
on Sellers.id_sel=orders.id_sel
where city_sel='Yerevan' and year(date_ord)<2013
--6_5
SELECT Customers.lname_cust,Customers.city_cust,avg(orders.sum_ord)
FROM Customers
join Orders 
on Customers.id_cust=orders.id_cust
Where year(date_ord)=2012
Group by Customers.lname_cust,Customers.city_cust,year(date_ord)
--6_6
Select *
from Customers
Right join Goods
on Customers.id_cust=goods.id_cust
