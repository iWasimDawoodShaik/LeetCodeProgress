
DROP TABLE Person;

CREATE TABLE Person (
	id INT PRIMARY KEY,
	email VARCHAR(255) NOT NULL
);

INSERT INTO Person (id, email)
VALUES (1, 'john@example.com'),
	(2, 'bob@example.com'),
	(3, 'john@example.com');

SELECT *
FROM Person;

DELETE FROM Person
WHERE ( id IN 
(SELECT id
FROM (SELECT *,
	ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rn
FROM Person) AS TB
WHERE TB.rn > 1));

SELECT * 
FROM Person;





