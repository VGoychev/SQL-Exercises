SELECT department_id, COUNT(first_name) AS number_employees_in_department, SUM(salary) AS s
FROM soft_uni.employees GROUP BY department_id;

SELECT department_id, COUNT(employee_id) AS count, SUM(salary) AS sum_sal FROM employees
WHERE salary > 40000
GROUP BY department_id;

SELECT e.*, d.`name` FROM employees AS e
JOIN departments AS d
ON d.department_id = e.department_id;

SELECT department_id, SUM(salary) AS sums
FROM employees
WHERE department_id > 5
GROUP BY department_id, first_name
HAVING sums > 110000 AND sums < 200000;

SELECT * FROM employees
WHERE department_id = 16;

#Exercise 1
SELECT department_id, COUNT(id) AS count FROM employees
GROUP BY department_id
ORDER BY department_id, count;

#Exercise 2
SELECT department_id, ROUND(AVG(salary),2) AS avg_salary FROM employees
GROUP BY department_id
ORDER BY department_id;

#Exercise 3
SELECT department_id, ROUND(MIN(salary),2) AS min_salary FROM employees
GROUP BY department_id
HAVING min_salary > 800;

#Exercise 4
SELECT * FROM products;

SELECT COUNT(category_id) AS appetizers FROM products
WHERE category_id = 2 AND price > 8
GROUP BY category_id;

#Exercise 5
SELECT category_id, ROUND(AVG(price),2) AS avg_price, ROUND(MIN(price),2) AS cheapest_product, ROUND(MAX(price),2) AS most_expensive_product
FROM products
GROUP BY category_id;








