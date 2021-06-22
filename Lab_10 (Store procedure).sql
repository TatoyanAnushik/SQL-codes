--10_1
------
--10_2
Create proc pr_2
As
Set nocount on
Select ProductName
From Products
Where Left(ProductName,2) = 'Ch' and UnitPrice <= 20

exec pr_2

--10_3
Alter proc pr_3
with encryption
As
Set nocount on
Select ProductName, UnitPrice, UnitsInStock, UnitPrice*UnitsInStock as sum
From Products

exec pr_3

--10_4
Alter proc pr_4
@year int=1997
As
Select Customers.ContactName,Orders.OrderDate
From Customers
join Orders
on Customers.CustomerID = Orders.CustomerID
where Year(Orders.OrderDate) = @year

exec pr_4 

--10_5
Alter proc pr_5
@id int=5, @employee varchar(25) output
As
Select @employee=Title
From Employees
where EmployeeID = @id

declare @a varchar(25)
exec pr_5 6,@a output
print @a

--10.6
sp_helptext pr_2
sp_help pr_5