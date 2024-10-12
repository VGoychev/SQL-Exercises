CREATE DATABASE IF NOT EXISTS `hospital`; 
USE `hospital`;

CREATE TABLE departments (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50)
);

INSERT INTO departments(name) VALUES('Therapy'), ('Support'), ('Management'), ('Other');

CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	job_title VARCHAR(50) NOT NULL,
	department_id INT NOT NULL,
	salary DOUBLE NOT NULL,
	CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
);

INSERT INTO `employees` (`first_name`,`last_name`, `job_title`,`department_id`,`salary`) VALUES
	('John', 'Smith', 'Therapist',1, 900.00),
	('John', 'Johnson', 'Acupuncturist',1, 880.00),
	('Smith', 'Johnson', 'Technician',2, 1100.00),
	('Peter', 'Petrov', 'Supervisor',3, 1100.00),
	('Peter', 'Ivanov', 'Dentist',4, 1500.23),
	('Ivan' ,'Petrov', 'Therapist',1, 990.00),
	('Jack', 'Jackson', 'Epidemiologist',4, 1800.00),
	('Pedro', 'Petrov', 'Medical Director',3, 2100.00),
	('Nikolay', 'Ivanov', 'Nutrition Technician',4, 1600.00);
	

	
CREATE TABLE rooms (
	id INT PRIMARY KEY AUTO_INCREMENT,
	occupation VARCHAR(30)
);

INSERT INTO rooms(`occupation`) VALUES('free'), ('occupied'),('free'),('free'),('occupied');

CREATE TABLE patients (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	room_id INT NOT NULL
);

INSERT INTO patients(`first_name`,`last_name`,`room_id`) VALUES('Pesho','Petrov',1),('Gosho','Georgiev',3),('Mariya','Marieva', 2), ('Katya','Katerinova', 2), ('Nikolay','Nikolaev',3);

SELECT first_name, salary FROM employees
WHERE salary > 1000;

INSERT INTO departments(`name`)
VALUES('New department 3 ');

UPDATE departments
SET `name` = 'Sales'
WHERE `name` = 'New department 3 ';

SET SQL_SAFE_UPDATES = 0;

UPDATE departments
SET `name` = 'Sales updated', `id` = 35
WHERE `name` = 'Sales';

SELECT * FROM departments;

#Exercise 1
SELECT id, first_name, last_name, job_title FROM employees
ORDER BY first_name DESC;

#Exercise 2
SELECT id, first_name, last_name, job_title FROM employees AS e
ORDER BY first_name DESC
LIMIT 3;

SELECT concat(first_name, ' Surname Missing ', last_name) AS fulname
FROM employees AS e;

SELECT concat_ws(' ', first_name, last_name) AS col
FROM employees AS e;

#Exercise 3
SELECT id, concat_ws(' ', first_name, last_name) AS fullname, job_title, salary
FROM employees AS e
WHERE salary > 1000
ORDER BY id ASC;

SELECT * FROM employees
WHERE salary NOT IN (1100,990)
ORDER BY id ASC;

SELECT * FROM employees
WHERE salary = 1100 AND first_name != 'Peter'
ORDER BY id ASC;

#Exercise 4
UPDATE employees
SET salary = salary * 1.1
WHERE job_title = 'Therapist';

SELECT salary FROM employees
ORDER BY salary ASC;

CREATE TABLE workers
AS SELECT first_name FROM employees;




