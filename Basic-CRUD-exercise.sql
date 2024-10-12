#Exercise 1
SELECT * FROM departments
ORDER BY department_id ASC;

#Exercise 2
SELECT name FROM departments;

#Exercise 3
SELECT first_name, last_name, salary FROM employees
ORDER BY employee_id ASC;

#Exercise 4
SELECT first_name, middle_name, last_name FROM employees
ORDER BY employee_id ASC;

#Exercise 5
SELECT concat(first_name, '.', last_name, '@softuni.bg') AS full_email_address FROM employees;

#Exercise 6
SELECT DISTINCT salary FROM employees;

#Exercise 7
SELECT * FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY employee_id ASC;

#Exercise 8
SELECT first_name, last_name, job_title AS JobTitle FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id ASC;

#Exercise 9
SELECT concat_ws(' ', first_name, middle_name, last_name) AS 'Full Name' FROM employees
WHERE salary = 25000 OR salary = 14000 OR salary=12500 OR salary = 23600;

#Exercise 10
SELECT first_name, last_name FROM employees
WHERE manager_id IS NULL;

#Exercise 11
SELECT first_name, last_name, salary FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

#Exercise 12
SELECT first_name, last_name FROM employees
ORDER BY salary DESC
LIMIT 5;

#Exercise 13
SELECT first_name, last_name FROM employees
WHERE department_id  <> 4;

#Exercise 14
SELECT * FROM employees
ORDER BY salary DESC, first_name ASC, last_name DESC, middle_name ASC, employee_id ASC;

#Exercise 15
CREATE VIEW v_employees_salaries
AS
	SELECT first_name, last_name, salary FROM employees;
    
SELECT * FROM v_employees_salaries;

#Exercise 16
CREATE VIEW v_employees_job_titles
AS
	SELECT concat_ws(' ', first_name,
    CASE 
		WHEN middle_name IS NULL THEN ""
        ELSE middle_name
        END,
        last_name) AS ful_name, job_title FROM employees;
        
        SELECT * FROM v_employees_job_titles;
        
 #Exercise 17
 SELECT DISTINCT job_title FROM employees
 ORDER BY job_title ASC;
 
 #Exercise 18
 SELECT * FROM projects
 ORDER BY start_date ASC, name ASC, project_id ASC
 LIMIT 10;
 
 #Exercise 19
 SELECT first_name, last_name, hire_date FROM employees
 ORDER BY hire_date DESC
 LIMIT 7;
 
 #Exercise 20
 UPDATE employees
 SET salary = salary * 1.12
 WHERE department_id = 1 OR department_id = 2 OR department_id = 4 OR department_id = 11;
 
 SELECT salary FROM employees;
 
 #Exercise 21
SELECT peak_name FROM peaks
ORDER BY peak_name ASC;

#Exercise 22
SELECT country_name, population FROM countries
WHERE continent_code = 'EU'
ORDER BY population DESC, country_name ASC
LIMIT 30;

#Exercise 23
SELECT country_name, country_code,
CASE 
	WHEN currency_code = 'EUR' THEN 'Euro'
    ELSE 'Not Euro'
    END AS currency FROM countries
ORDER BY country_name ASC;

#Exercise 24
SELECT name FROM characters
ORDER BY name ASC;
