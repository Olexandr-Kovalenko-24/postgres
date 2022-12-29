SELECT id, first_name FROM users;

SELECT first_name, last_name FROM users;

SELECT * FROM users
WHERE id = 2220;

SELECT * FROM users
WHERE gender = 'male';

SELECT * FROM users
WHERE gender = 'male' AND is_subscribed;

SELECT * FROM users
WHERE id % 2 = 0;

SELECT * FROM users
WHERE gender = 'female' AND is_subscribed = false;

SELECT email FROM users
WHERE is_subscribed;


SELECT * FROM users
WHERE first_name = 'John';

SELECT * FROM users
WHERE first_name IN ('John', 'Clark');


SELECT * FROM users
WHERE id IN (1, 10, 2500);


SELECT * FROM users
WHERE id > 2500 AND id < 3000;


SELECT * FROM users
WHERE id BETWEEN 2500 AND 3000;


SELECT * FROM users
WHERE first_name LIKE 'K%';


SELECT * FROM users
WHERE first_name LIKE '_____';


SELECT * FROM users
WHERE first_name LIKE '%a';


UPDATE users
SET weight = 60
WHERE id BETWEEN 2500 AND 2550;


UPDATE users
SET weight = 70
WHERE id % 5 = 0 RETURNING *;

DELETE FROM users
WHERE id = 2222
RETURNING *;

