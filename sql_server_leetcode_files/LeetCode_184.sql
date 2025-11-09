USE [70-461];

CREATE TABLE Department
(
	id INT PRIMARY KEY,
	name VARCHAR(5) NOT NULL
);


CREATE TABLE Employee
(
	id INT PRIMARY KEY,
	name VARCHAR(5),
	salary INT,
	departmentId INT,
	FOREIGN KEY (departmentId) REFERENCES Department (id)
);

INSERT INTO Department (id, name)
VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO Employee (id, name, salary, departmentId)
VALUES
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

SELECT * FROM Employee;

SELECT * FROM Department;

-- LeetCode Solution # 184

WITH CTE_One AS (
SELECT D.name AS Department,
	E.name AS Employee,
	E.salary AS Salary,
	RANK() OVER(PARTITION BY E.departmentId ORDER BY E.salary DESC) AS rnk
FROM Employee AS E
	INNER JOIN  Department AS D
		ON E.departmentId = D.id)

SELECT Department,
	Employee,
	Salary
FROM CTE_One
WHERE rnk = 1;





DELETE FROM Employee;

--TRUNCATE TABLE Employee;

SELECT * FROM Employee;

DROP TABLE [70-461].[dbo].[Employee];

--DELETE FROM Department;

TRUNCATE TABLE Department;

SELECT * FROM Department;

DROP TABLE [70-461].[dbo].[Department];

