SELECT e.`first_name`, d.`name` AS deot_name
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id;

CREATE TABLE auto_filled_1(
address_id VARCHAR(44),
town VARCHAR(44)
);

INSERT INTO auto_filled_1
SELECT a.address_id, t.`name` AS town_name_joined_column
FROM addresses AS a
JOIN towns AS t
ON a.town_id = t.town_id
ORDER BY a.address_id LIMIT 15;


#Exercise 1
SELECT e.employee_id,
CONCAT(e.first_name, " ", e.last_name) AS full_name,
d.department_id, d.`name`
FROM employees AS e
RIGHT JOIN departments AS d
ON e.employee_id = d.manager_id
ORDER BY e.employee_id LIMIT 5;

#Exercise 2
SELECT t.town_id, t.`name`, a.address_text
FROM addresses as a
JOIN towns AS t
ON a.town_id = t.town_id
WHERE t.`name` IN('Carnation', 'Sofia', 'San Francisco')
ORDER BY a.town_id, a.address_id;

#Exercise 3
SELECT e.employee_id, e.first_name, e.last_name, e.department_id, e.salary, s.first_name AS manager_name
FROM employees AS e
LEFT JOIN employees AS s
ON e.employee_id = s.manager_id
WHERE e.manager_id IS NULL;

#Exercise 4
SELECT COUNT(*) FROM employees
WHERE salary > ( SELECT AVG(salary) FROM employees LIMIT 1 );

