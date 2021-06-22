 --8_1
Select orders.*
From Orders
Where orders.sum_ord IN
		(Select customers.credit
		From Customers)

--8_2
Select customers.*
From Customers
Where customers.id_cust=
		(Select orders.id_cust
		From Orders
		Where orders.sum_ord=70000)

--8_3
Select customers.*
From Customers
Where customers.id_cust IN 
		(Select orders.id_cust
		From Orders)

--8_4_1
Select customers.*
From Customers
Where customers.id_cust=ANY  --IN
		(Select orders.id_cust
		From Orders
		Group by orders.id_cust
		Having sum(orders.sum_ord)<=60000)

--8_4_2
Select customers.lname_cust,name_cust,sum(orders.sum_ord)
From Customers
Join Orders
On customers.id_cust=orders.id_cust
Group by customers.id_cust,customers.lname_cust,name_cust
Having sum(orders.sum_ord)<=60000 --and orders.sum_ord>0


