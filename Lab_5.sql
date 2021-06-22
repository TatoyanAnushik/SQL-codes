--5_1
INSERT INTO Sellers VALUES('Artem','Avetisyan','Gyumri',15,'Hakobyan L.',130),
						  ('Hakob','Tadevosyan','Armavir',45,'Kirakosyan L.',15)
INSERT INTO Customers VALUES('Davit','Grigoryan','Vandzor',21,50000),
						   ('Armen','Mnacakanyan','Martuni',73,6000)
--5_2
INSERT INTO Goods (id_goods,goods_name,quantity,id_cust) VALUES(9,'Display',35,2)
--5_3
SELECT * INTO Yerevan_Sellers 
FROM Sellers
WHERE city_sel='Yerevan'
--5_4
DELETE FROM Yerevan_Sellers
--5_5
DELETE FROM Customers
WHERE rating_cust<50
--5_6
UPDATE Customers 
SET customers.credit=1.1*customers.credit
--5_7
UPDATE Orders 
SET sum_ord=0
WHERE year(date_ord)=2012

