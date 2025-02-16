DROP TABLE Person;

CREATE TABLE Person (
	id INT PRIMARY KEY,
	email VARCHAR(255)
);

INSERT INTO Person (id, email)
VALUES (1, 'a@b.com'),
	(2, 'c@d.com'),
	(3, 'a@b.com');

SELECT *
FROM Person;

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(id) > 1;

