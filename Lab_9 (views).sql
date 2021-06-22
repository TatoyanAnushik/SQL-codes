--9_1
Create view NORTHWIND
As
select FirstName as name,
	   LastName as lname
from Employees


Select * from NORTHWIND

--9_2
Create view NORTHWIND1
with encryption
As
Select LastName as lname,
	   max(Freight) as frt
from Employees
join Orders
on Employees.EmployeeID = Orders.EmployeeID
Group by LastName

--9_3
Create view NORTHWIND2
as
Select tbl2.LastName as lname,
	   tbl1.LastName as report
from Employees as tbl1
join Employees as tbl2
on tbl1.EmployeeID = tbl2.ReportsTo
Where tbl1.LastName='Fuller'

--9_4
Alter view NORTHWIND3
as
Select Suppliers.CompanyName as Cname,
		products.ProductName as pro,
		[Order Details].Discount as [count]
From  Suppliers
join Products
on Suppliers.SupplierID = Products.SupplierID
join [Order Details]
on  Products.ProductID = [Order Details].ProductID
Where [Order Details].Discount > 0.15

Select * From NORTHWIND3