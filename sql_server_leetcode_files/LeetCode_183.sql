USE [70-461];

CREATE TABLE Customers
(
	id INT PRIMARY KEY,
	name VARCHAR(5)
);

CREATE TABLE Orders
(
	id INT PRIMARY KEY,
	customerId INT,
	FOREIGN KEY (customerId) REFERENCES Customers (id)
);

INSERT INTO Customers (id, name)
VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

INSERT INTO Orders (id, customerId)
VALUES
(1, 3),
(2, 1);

SELECT * FROM Customers;

SELECT * FROM Orders;

-- LeetCode Solution # 183

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT DISTINCT customerId FROM Orders);



DELETE FROM Orders;

--TRUNCATE TABLE Orders;

SELECT * FROM Orders;

DROP TABLE [70-461].[dbo].[Orders];

--DELETE FROM Customers;

TRUNCATE TABLE Customers;

SELECT * FROM Customers;

DROP TABLE [70-461].[dbo].[Customers];