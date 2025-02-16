
DROP TABLE Employee;

CREATE TABLE Employee(
	id INT PRIMARY KEY,
	name VARCHAR(255),
	salary INT,
	managerId INT
);

INSERT INTO Employee(id, name, salary, managerId)
VALUES (1, 'Joe', 70000, 3),
	(2, 'Henry', 80000, 4),
	(3, 'Sam', 60000, NULL),
	(4, 'Max', 90000, NULL);

SELECT *
FROM Employee;

SELECT E.name AS Employee
FROM Employee AS E
	LEFT JOIN Employee AS M
		ON E.managerId = M.id
WHERE E.salary > M.salary;