#Exercise 1
SELECT e.employee_id, e.job_title, a.address_id, a.address_text 
FROM employees AS e
JOIN addresses AS a
ON e.address_id = a.address_id
ORDER BY address_id
LIMIT 5;

#Exercise 2
SELECT e.first_name, e.last_name, t.name AS town, a.address_text 
FROM employees AS e
JOIN addresses AS a
ON e.address_id = a.address_id
JOIN towns AS t
ON a.town_id = t.town_id
ORDER BY e.first_name, e.last_name
LIMIT 5;

#Exercise 3
SELECT e.employee_id, e.first_name, e.last_name, d.name AS department_name 
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
HAVING department_name = 'Sales'
ORDER BY e.employee_id DESC;

#Exercise 4
SELECT e.employee_id, e.first_name, e.salary, d.name AS department_name
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
HAVING e.salary > 15000
ORDER BY e.department_id DESC;

#Exercise 5
SELECT e.employee_id, e.first_name 
FROM employees AS e
WHERE e.employee_id NOT IN (SELECT ep.employee_id FROM employees_projects AS ep)
ORDER BY e.employee_id DESC
LIMIT 3;

#Exercise 6
SELECT e.first_name, e.last_name, e.hire_date, d.name AS dept_name
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.hire_date > '1999/01/01'
HAVING dept_name = 'Sales' OR dept_name = 'Finance'
ORDER BY hire_date;

#Exercise 7
SELECT e.employee_id, e.first_name, p.name AS project_name 
FROM employees AS e
JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id
JOIN projects AS p
ON ep.project_id = p.project_id
WHERE p.start_date > '2002-08-13' AND p.end_date IS NULL
ORDER BY first_name, project_name;

#Exercise 8
SELECT e.employee_id, e.first_name, (CASE
    WHEN p.start_date > '2004-12-31' THEN NULL
    ELSE p.`name`
    END) AS project_name
FROM employees AS e
JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id
JOIN projects AS p
ON ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY project_name;

#Exercise 9
SELECT e.employee_id, e.first_name,
(SELECT e.manager_id FROM employees AS m WHERE e.manager_id = m.employee_id) AS 'manager_id',
(SELECT m.first_name FROM employees AS m WHERE e.manager_id = m.employee_id) AS 'manager_name'
FROM employees AS e
WHERE manager_id = 3 OR manager_id = 7
ORDER BY e.first_name;

#Exercise 10
SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
(SELECT CONCAT(m.first_name, ' ', m.last_name) FROM employees AS m WHERE e.manager_id = m.employee_id) AS manager_name,
d.name AS department_name
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;

#Exercise 11
SELECT MIN(min_salaries) AS min_average_salary
FROM 
( 
	SELECT AVG(salary) AS min_salaries
    FROM employees
    GROUP BY department_id
    
) AS min_salary;

#Exercise 12
SELECT c.country_code, m.mountain_range, p.peak_name, p.elevation 
FROM peaks AS p
JOIN mountains AS m
ON p.mountain_id = m.id
JOIN mountains_countries AS c
ON m.id = c.mountain_id
WHERE c.country_code = 'BG' AND p.elevation > 2835
ORDER BY p.elevation DESC;

#Exercise 13
SELECT country_code, COUNT(mountain_id) AS mountain_range 
FROM mountains_countries
GROUP BY country_code
HAVING country_code = 'BG' OR country_code = 'RU' OR country_code = 'US'
ORDER BY mountain_range DESC;

#Exercise 14
SELECT c.country_name, r.river_name 
FROM countries AS c
LEFT JOIN countries_rivers AS cr
ON c.country_code = cr.country_code
LEFT JOIN rivers AS r
ON cr.river_id = r.id
WHERE c.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5;

#Exercise 16
SELECT COUNT(c.country_code) AS country_count
FROM countries AS c
LEFT JOIN mountains_countries AS mc
ON c.country_code = mc.country_code
WHERE mc.mountain_id IS NULL;

#Exercise 17
SELECT c.country_name, MAX(p.elevation) AS highest_peak_elevation, MAX(r.length) AS longest_river_length 
FROM countries AS c
LEFT JOIN mountains_countries AS mc
ON c.country_code = mc.country_code
LEFT JOIN peaks AS p
ON mc.mountain_id = p.mountain_id
LEFT JOIN countries_rivers AS cr
ON c.country_code = cr.country_code
LEFT JOIN rivers AS r
ON cr.river_id = r.id
GROUP BY c.country_code
ORDER BY highest_peak_elevation DESC, longest_river_length DESC, c.country_name
LIMIT 5;


 




