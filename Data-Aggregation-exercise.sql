SET SQL_SAFE_UPDATES = 0;
#Exercise 1
SELECT COUNT(*) AS count FROM wizzard_deposits;

#Exercise 2
SELECT MAX(magic_wand_size) AS longest FROM wizzard_deposits;

#Exercise 3
SELECT deposit_group, MAX(magic_wand_size) as longest FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY longest;

#Exercise 4
SELECT `deposit_group` FROM `wizzard_deposits`
GROUP BY deposit_group
HAVING min(`magic_wand_size`)
LIMIT 1;

#Exercise 5
SELECT deposit_group, SUM(deposit_amount) AS sum FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY sum;

#Exercise 6
SELECT deposit_group, SUM(deposit_amount) AS sum FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER by deposit_group;

#Exercise 7
SELECT deposit_group, SUM(deposit_amount) AS sum FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING sum < 150000
ORDER by sum DESC;

#Exercise 8
SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) AS min_deposit_charge FROM wizzard_deposits
GROUP BY deposit_group, magic_wand_creator
ORDER BY magic_wand_creator, deposit_group;

#Exercise 9
SELECT (CASE
WHEN age BETWEEN 0 AND 10 THEN '[0-10]'
WHEN age BETWEEN 11 AND 20 THEN '[11-20]'
WHEN age BETWEEN 21 AND 30 THEN '[21-30]'
WHEN age BETWEEN 31 AND 40 THEN '[31-40]'
WHEN age BETWEEN 41 AND 50 THEN '[41-50]'
WHEN age BETWEEN 51 AND 60 THEN '[51-60]'
ELSE '[61+]'
END) AS age_group , COUNT(id) as wizard_count FROM wizzard_deposits
GROUP BY age_group
ORDER BY age_group;

#Exercise 10
SELECT SUBSTRING(first_name,1,1) AS first_letter FROM wizzard_deposits
WHERE deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY first_letter;

#Exercise 11
SELECT deposit_group, is_deposit_expired, AVG(deposit_interest) AS average_interest FROM wizzard_deposits
WHERE deposit_start_date > '1985/01/01'
GROUP BY deposit_group, is_deposit_expired
ORDER BY deposit_group DESC, is_deposit_expired;

#Exercise 12
SELECT SUM(diff.next) AS sum_difference
 FROM( 
	SELECT deposit_amount - (SELECT deposit_amount FROM wizzard_deposits
							WHERE id = wd.id + 1) AS next
	FROM wizzard_deposits AS wd) AS diff;
 
 #Exercise 13
 SELECT department_id, MIN(salary) AS min_salary FROM employees
 WHERE (department_id = 2 OR department_id = 5 OR department_id = 7) AND hire_date > '2000/01/01'
 GROUP BY department_id
 ORDER BY department_id;
 
 #Exercise 14
 CREATE TABLE `average_salaries` AS
SELECT * FROM `employees` WHERE `salary` > 30000;

DELETE FROM `average_salaries`
WHERE `manager_id` = 42;

UPDATE `average_salaries`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;

SELECT `department_id`, AVG(`salary`) AS 'avg_salary'
FROM `average_salaries`
GROUP BY `department_id`
ORDER BY `department_id`;

#Exercise 15
SELECT department_id, MAX(salary) as max_salary FROM employees
GROUP BY department_id
HAVING max_salary < 30000 OR max_salary > 70000
ORDER BY department_id;

#Exercise 16
SELECT COUNT(salary) AS count FROM employees
WHERE manager_id IS NULL;

#Exercise 19
SELECT department_id, SUM(salary) as total_salary FROM employees
GROUP BY department_id
ORDER BY department_id;

 
 