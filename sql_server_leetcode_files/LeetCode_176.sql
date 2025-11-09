USE [70-461];

CREATE TABLE Employee
(
	id INT PRIMARY KEY,
	salary INT
);

INSERT INTO Employee (id, salary)
VALUES
(1, 100),
(2, 200),
(3, 300);

SELECT * FROM Employee;

-- LeetCode Solution # 176

SELECT (
SELECT salary
FROM (
SELECT salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) AS d_rnk
FROM Employee
GROUP BY salary) AS src
WHERE d_rnk = 2) AS SecondHighestSalary;




DELETE FROM Employee;

--TRUNCATE TABLE Employee;

SELECT * FROM Employee;

DROP TABLE [70-461].[dbo].[Employee];