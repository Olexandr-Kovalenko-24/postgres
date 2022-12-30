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

SELECT * FROM users
WHERE birthday < '2004-01-01';

SELECT first_name, extract("years" from age(birthday)) FROM users;

SELECT * FROM users
WHERE extract("years" from age(birthday)) > 25;


SELECT email FROM users
WHERE gender = 'male' AND extract("years" from age(birthday)) >= 18 AND extract("years" from age(birthday)) <= 60;


SELECT email, birthday FROM users
WHERE gender = 'male' AND (extract("years" from age(birthday)) BETWEEN 18 AND 60);




SELECT * FROM users
WHERE extract("month" from birthday) = 10;


SELECT email FROM users
WHERE (extract("day" from birthday) = 1) AND (extract("month" from birthday) = 11);


UPDATE users
SET height = 2.00
WHERE extract("years" from age(birthday)) >= 60 RETURNING *;


UPDATE users
SET weight = 80
WHERE gender = 'male' AND (extract("years" from age(birthday)) BETWEEN 30 AND 50) RETURNING *;



SELECT * FROM users;

SELECT id AS "Порядковий номер",
first_name AS "ім'я",
last_name AS "Прізвище",
email AS "Пошта",
is_subscribed AS "Підписка"
FROM users AS u;

SELECT * FROM users AS u
WHERE u.id = 2222;



SELECT * 
FROM users
LIMIT 10;


SELECT * FROM users
LIMIT 10
OFFSET 10;


SELECT * FROM orders
LIMIT 50
OFFSET 100;




SELECT id, first_name ||  ' ' || last_name AS full_name FROM users;

SELECT id, concat(first_name, ' ', last_name) AS full_name 
FROM users
WHERE char_length(concat(first_name, ' ', last_name)) > 10;

SELECT * FROM (
    SELECT id, concat(first_name, ' ', last_name) AS full_name 
    FROM users
) AS fn
WHERE char_length(fn.full_name) > 10;







DROP TABLE workers;
CREATE TABLE workers(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    salary numeric(7,2) NOT NULL,
    birthday date CHECK (birthday < current_date)
);


INSERT INTO workers (name, birthday, salary) VALUES
('Олег', '1990-01-01', 300);

INSERT INTO workers (name, salary) VALUES
('Ярослава', 1200);

INSERT INTO workers (name, birthday, salary) VALUES
('Саша', '1985-05-03', 85),
('Маша', '1995-11-23', 85);

UPDATE workers
SET salary = 500
WHERE name = 'Олег';

UPDATE workers
SET salary = 900
WHERE name = 'Маша';

UPDATE workers
SET salary = 1000
WHERE name = 'Саша';

UPDATE workers
SET birthday = '1987-09-09'
WHERE id = 4;

UPDATE workers
SET salary = 700
WHERE salary > 500;

UPDATE workers
SET birthday = '1999-03-05'
WHERE id BETWEEN 2 AND 5;

UPDATE workers
SET name = 'Женя'
WHERE name = 'Саша';

UPDATE workers
SET salary = 900
WHERE name = 'Женя';

SELECT * FROM workers
WHERE salary > 400;

SELECT * FROM workers
WHERE id > 4;

SELECT salary, extract("years" from age(birthday)) FROM workers
WHERE name = 'Женя';

SELECT * FROM workers
WHERE name = 'Петя';

SELECT * FROM workers
WHERE (extract("years" from age(birthday))=27) OR salary > 800;

SELECT * FROM workers
WHERE (extract("years" from age(birthday)) BETWEEN 25 AND 28);

SELECT * FROM workers
WHERE (extract("month" from birthday) = 9);

DELETE FROM workers
WHERE id = 4;

DELETE FROM workers
WHERE name = 'Олег';

DELETE FROM workers
WHERE extract("years" from age(birthday))>30;



INSERT INTO workers (name, birthday, salary) VALUES
('Олег', '1990-01-01', 300);

UPDATE workers
SET salary = 1200, name = 'Олег'
WHERE name = 'Женя';