INSERT INTO Movies (Title, Director, ReleaseYear, Price)
VALUES ('Interstellar', 'Christoper Nolan', '2014', 179), 
('Hobbit:Battle of the five armies', 'Peter Jackson', '2014', 179), 
('The Wolf of Wall Street', 'Martin Scorcese', '2013', 119),
		('Pulp Fiction', 'Quentin Tarantino', '1994', 49);

INSERT INTO Orders(OrderDate, CustomerId)
VALUES ('20150101', (SELECT Id FROM Customers WHERE Customers.FirstName= 'Jonas' AND Customers.LastName= 'Gray'));

SELECT * FROM Orders;

--Exercise 3

INSERT INTO Orders(OrderDate, CustomerId)
VALUES ('20150115', (SELECT Id FROM Customers WHERE Customers.FirstName= 'Peter' AND Customers.LastName= 'Birro'));

SELECT * FROM Orders;

INSERT INTO Orders(OrderDate, CustomerId)
VALUES ('20141220', (SELECT Id FROM Customers WHERE Customers.FirstName= 'Jonas' AND Customers.LastName= 'Gray'));

SELECT * FROM Orders;

INSERT INTO OrderRows(OrderId, MovieId, Price)
VALUES  ((SELECT Id 
		FROM Orders 
		WHERE (Orders.Id = (SELECT Id 
							FROM Customers 
							WHERE Customers.FirstName= 'Jonas' AND Customers.LastName= 'Gray'))), 
        (SELECT Id 
		FROM Movies 
		WHERE Movies.Title = 'Interstellar'),
		(SELECT Price 
		FROM Movies
		WHERE Movies.Title='Interstellar'));

SELECT * FROM OrderRows;

INSERT INTO OrderRows(OrderId, MovieId, Price)
VALUES  ((SELECT Id 
		FROM Orders 
		WHERE (Orders.Id = (SELECT Id 
							FROM Customers 
							WHERE Customers.FirstName= 'Jonas' AND Customers.LastName= 'Gray'))), 
        (SELECT Id 
		FROM Movies 
		WHERE Movies.Title = 'Pulp Fiction'),
		(SELECT Price 
		FROM Movies
		WHERE Movies.Title='Pulp Fiction'));

SELECT * FROM OrderRows;

INSERT INTO OrderRows(OrderId, MovieId, Price)
VALUES  ((SELECT Id 
		FROM Orders 
		WHERE (Orders.Id = (SELECT Id 
							FROM Customers 
							WHERE Customers.FirstName= 'Peter' AND Customers.LastName= 'Birro'))), 
        (SELECT Id 
		FROM Movies 
		WHERE Movies.Title = 'The Wolf of Wall Street'),
		(SELECT Price 
		FROM Movies
		WHERE Movies.Title='The Wolf of Wall Street'));

SELECT * FROM OrderRows;

INSERT INTO OrderRows(OrderId, MovieId, Price)
VALUES  ((SELECT Id 
		FROM Orders 
		WHERE (Orders.Id = (SELECT Id 
							FROM Customers 
							WHERE Customers.FirstName= 'Peter' AND Customers.LastName= 'Birro'))), 
        (SELECT Id 
		FROM Movies 
		WHERE Movies.Title = 'The Wolf of Wall Street'),
		(SELECT Price 
		FROM Movies
		WHERE Movies.Title='The Wolf of Wall Street'));

SELECT * FROM OrderRows;

INSERT INTO OrderRows(OrderId, MovieId, Price)
VALUES  ((SELECT Id 
		FROM Orders 
		WHERE (Orders.Id = (SELECT Id 
							FROM Customers 
							WHERE Customers.FirstName= 'Jonas' AND Customers.LastName= 'Gray'))), 
        (SELECT Id 
		FROM Movies 
		WHERE Movies.Title = 'The Wolf of Wall Street'),
		(SELECT Price 
		FROM Movies
		WHERE Movies.Title='The Wolf of Wall Street'));

SELECT * FROM OrderRows;

--Exercise 4

UPDATE Movies SET Price=169 
WHERE ReleaseYear='2014';

SELECT * FROM Movies; 

--Exercise 5-a
SELECT Firstname, Lastname, PhoneNo, EmailAddress   FROM Customers;

--Exercise 5-b
 	
SELECT Movies.Title, Movies.ReleaseYear
FROM Movies, OrderRows , Orders
WHERE (Movies.Id=OrderRows.MovieId AND OrderRows.OrderId=Orders.Id AND Orders.OrderDate BETWEEN '20150101' AND '20160101')
ORDER BY Movies.ReleaseYear DESC;

--Exercise 5-c

SELECT Movies.Title, Movies.Price
FROM Movies
ORDER BY Movies.Price 

--Exercise 5-d

SELECT Customers.Firstname, Customers.Lastname, Customers.Id as CustomersId, Customers.DelieveryAddress, Orders.Id as IdOrder,
		Customers.DelieveryZip, Customers.DelieveryCity  , Movies.Title 
FROM Customers 
 JOIN Orders ON Orders.CustomerId=Customers.Id
		  JOIN OrderRows ON OrderRows.OrderId=Orders.Id
		  JOIN Movies ON OrderRows.MovieId=Movies.Id
		WHERE Movies.Title='The Wolf of Wall Street'


--Exercise 5-e

SELECT Orders.Id, Orders.OrderDate, Customers.Firstname, Customers.Lastname, OrderRows.Price
FROM Customers , Orders , OrderRows , Movies
 WHERE   OrderRows.MovieId=Movies.Id
		AND Orders.CustomerId=Customers.Id 
		AND OrderRows.OrderId=Orders.Id 

--Exercise 6

ALTER TABLE Customers
ADD CellNo nvarchar(15) NOT NULL default ''
GO

UPDATE Customers
SET CellNo=PhoneNo

UPDATE Customers
SET PhoneNo=''

