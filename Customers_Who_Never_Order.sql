
DROP TABLE Customers;

DROP TABLE Orders;

CREATE TABLE Customers (
	id INT PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO Customers (id, name)
VALUES (1, 'Joe'),
	(2, 'Henry'),
	(3, 'Sam'),
	(4, 'Max');

SELECT *
FROM Customers;

CREATE TABLE Orders (
	id INT PRIMARY KEY,
	customerId INT FOREIGN KEY REFERENCES Customers(id)
);

INSERT INTO Orders (id, customerId)
VALUES (1, 3),
	(2, 1);

SELECT *
FROM Orders;

SELECT C.name AS Customers
FROM Customers AS C
	LEFT JOIN Orders AS O
		ON C.id = O.customerId
WHERE O.id IS NULL;