#Exercise 1
SELECT first_name, last_name FROM employees
WHERE substring(first_name, 1, 2) = 'Sa'
ORDER BY employee_id ASC;

#Exercise 2
SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%ei%'
ORDER BY employee_id ASC;

#Exercise 3
SELECT first_name FROM employees
WHERE department_id = 3 OR department_id=10 
AND EXTRACT(year FROM hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id ASC;

#Exercise 4
SELECT first_name, last_name FROM employees
WHERE job_title NOT LIKE '%engineer%'
ORDER BY employee_id ASC;

#Exercise 5
SELECT name FROM towns
WHERE CHAR_LENGTH(name) = 5 OR CHAR_LENGTH(name) = 6
ORDER BY name ASC;

#Exercise 6
SELECT town_id, name FROM towns
WHERE substring(name,1,1) = 'M' OR substring(name,1,1) = 'K' OR substring(name,1,1) = 'B' OR substring(name,1,1) = 'E'
ORDER BY name ASC;

#Exercise 7
SELECT `town_id`, `name` 
FROM towns
WHERE `name` NOT LIKE 'R%' 
  AND `name` NOT LIKE 'B%' 
  AND `name` NOT LIKE 'D%'
ORDER BY `name` ASC;

#Exercise 8
CREATE VIEW v_employees_hired_after_2000 
	AS
		SELECT first_name, last_name FROM employees
		WHERE EXTRACT(year FROM hire_date) > 2000;
        
SELECT * FROM v_employees_hired_after_2000;

#Exercise 9
SELECT first_name, last_name FROM employees
WHERE CHAR_LENGTH(last_name) = 5;

#Exercise 10
SELECT country_name, iso_code FROM countries
WHERE  `country_name` LIKE '%A%A%A%'
ORDER BY iso_code ASC;

#Exercise 11
SELECT p.peak_name, r.river_name, LOWER(concat(peak_name,SUBSTRING(river_name,2))) AS mix
FROM rivers AS r, peaks AS p
WHERE right(peak_name, 1) = left(river_name, 1)
ORDER BY mix;

#Exercise 12
SELECT name, start FROM games
WHERE EXTRACT(year FROM start)  BETWEEN 2011 AND 2012
ORDER BY start ASC, name ASC;

#Exercise 13
SELECT user_name, SUBSTRING(email, LOCATE('@', email) + 1) AS 'Email Provider' FROM users
ORDER BY SUBSTRING(email, LOCATE('@', email) + 1) ASC, user_name ASC;

#Exercise 14
SELECT user_name, ip_address FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;

#Exercise 15
SELECT name AS game, 
(CASE
WHEN HOUR(`start`) BETWEEN 0 AND 11 THEN 'Morning'
WHEN HOUR(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
WHEN HOUR(`start`) BETWEEN 18 AND 24 THEN 'Evening'
END), (CASE
WHEN `duration` BETWEEN 0 AND 3 THEN 'Extra Short'
WHEN `duration` BETWEEN 4 AND 6 THEN 'Short'
WHEN `duration` BETWEEN 7 AND 10 THEN 'Long'
ELSE 'Extra Long'
END) AS 'Duration' FROM games;

#Exercise 16
SELECT o.id, o.product_name, o.order_date, DATE_ADD(`order_date`, INTERVAL 3 DAY) AS 'pay due',
date_add(`order_date`, INTERVAL 1 MONTH) AS 'delivery due'
FROM orders AS o;
