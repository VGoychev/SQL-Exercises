#Exercise 1
CREATE TABLE mountains(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
`name` VARCHAR(45) NOT NULL);

CREATE TABLE peaks(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(45),
mountain_id INT,
CONSTRAINT fk_peak_mountain
FOREIGN KEY (mountain_id)
REFERENCES mountains(id));

#Exercise 2
SELECT v.driver_id, v.vehicle_type, CONCAT(c.first_name, ' ', c.last_name) AS driver_name 
FROM vehicles AS v
JOIN campers AS c
ON v.driver_id = c.id
ORDER BY c.id;

#Exercise 3
SELECT r.starting_point AS start_point, r.end_point AS end_point, r.leader_id AS leader_id , CONCAT(c.first_name, ' ', c.last_name) AS leader_name
FROM routes as r
JOIN campers AS c
ON r.leader_id = c.id;

#Exercise 4
ALTER TABLE `camp`.`peaks` 
DROP FOREIGN KEY `fk_peak_mountain`;

ALTER TABLE `camp`.`peaks` 
ADD CONSTRAINT `fk_peak_mountain`
  FOREIGN KEY (`mountain_id`)
  REFERENCES `camp`.`mountains` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

#Exercise 5
CREATE database project_management;

CREATE TABLE clients (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
client_name VARCHAR(100));

CREATE TABLE projects (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
client_id INT,
project_lead_id INT);

CREATE TABLE employees (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(45),
last_name VARCHAR(45),
project_id INT);

ALTER TABLE employees
ADD CONSTRAINT fk_employee_project
FOREIGN KEY(project_id)
REFERENCES projects(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE projects
ADD CONSTRAINT fk_project_client
FOREIGN KEY(client_id)
REFERENCES clients(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE projects
ADD CONSTRAINT fk_project_employee
FOREIGN KEY(project_lead_id)
REFERENCES employees(id)
ON DELETE CASCADE
ON UPDATE CASCADE;
