#Exercise 1
CREATE database exercise;

CREATE TABLE `persons` (
person_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(45),
salary DECIMAL(7,2),
passport_id INT);

CREATE TABLE `passports` (
passport_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
passport_number VARCHAR(100) UNIQUE);

ALTER TABLE `persons`
ADD CONSTRAINT fk_person_passport
FOREIGN KEY (passport_id)
REFERENCES `passports`(passport_id);

#Exercise 2
CREATE TABLE manufacturers(
manufacturer_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(30) UNIQUE,
established DATE );

CREATE TABLE models(
model_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(45),
manufacturer_id INT);

ALTER TABLE models
ADD CONSTRAINT fk_model_manufacturer
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturers(manufacturer_id);

INSERT INTO manufacturers
VALUES
(1, 'BMW', '1916/03/01'),
(2, 'Tesla', '2003/01/01'),
(3, 'Lada', '1966/05/01');

INSERT INTO models
VALUES
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Niva', 3);

#Exercise 3
CREATE TABLE students(
student_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(45)
);

CREATE TABLE exams(
exam_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(45));

CREATE TABLE students_exams (
student_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
exam_id INT);

ALTER TABLE students_exams
ADD CONSTRAINT fk_student_student
FOREIGN KEY (student_id)
REFERENCES students(student_id);

ALTER TABLE students_exams
ADD CONSTRAINT fk_student_exam
FOREIGN KEY (exam_id)
REFERENCES exams(exam_id);

INSERT INTO students
VALUES
(1, 'Mila'),
(2, 'Toni'),
(3, 'Ron');

INSERT INTO exams
VALUES
(101, 'Spring MVC'),
(102, 'Neo4j'),
(103, 'Oracle 11g');

INSERT INTO `students_exams` 
VALUES
(1, 1,101),
(2, 1,102),
(3, 2,101),
(4, 3,103),
(5, 2,102),
(6, 2,103);

#Exercise 4
CREATE TABLE  teachers(
teacher_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(45),
manager_id INT);

INSERT INTO teachers
VALUES
(101, 'John', NULL),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101);

ALTER TABLE teachers
ADD CONSTRAINT fk_teacher_manager
FOREIGN KEY (manager_id)
REFERENCES teachers(teacher_id);

#Exercise 5
CREATE DATABASE online_store;

CREATE TABLE item_types(
item_type_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(50));

CREATE TABLE items(
item_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(50),
item_type_id INT);

CREATE TABLE order_items(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
order_id INT,
item_id INT);

CREATE TABLE orders(
order_id INT,
customer_id INT);

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(50),
birthday DATE,
city_id INT);

CREATE TABLE cities (
city_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(50));

ALTER TABLE items
ADD CONSTRAINT fk_item_type
FOREIGN KEY (item_type_id)
REFERENCES item_types(item_type_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_item_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_item
FOREIGN KEY (item_id)
REFERENCES items(item_id);

ALTER TABLE orders
ADD CONSTRAINT fk_order_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE customers
ADD CONSTRAINT fk_customer_city
FOREIGN KEY (city_id)
REFERENCES cities(city_id);

#Exercise 6
CREATE DATABASE university;

CREATE TABLE subjects(
subject_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
subject_name VARCHAR(45));

CREATE TABLE agenda(
student_id INT UNIQUE,
subject_id INT UNIQUE);

CREATE TABLE students(
student_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
student_number VARCHAR(12),
student_name VARCHAR(50),
major_id INT);

CREATE TABLE majors(
major_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(50));

CREATE TABLE payments(
payment_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
payment_date DATE,
payment_amount DECIMAL(8,2),
student_id INT);

ALTER TABLE agenda
ADD CONSTRAINT fk_agenda_student
FOREIGN KEY (student_id)
REFERENCES students(student_id);

ALTER TABLE agenda
ADD CONSTRAINT fk_agenda_subject
FOREIGN KEY (subject_id)
REFERENCES subjects(subject_id);

ALTER TABLE students
ADD CONSTRAINT fk_student_major
FOREIGN KEY (major_id)
REFERENCES majors(major_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payment_student
FOREIGN KEY (student_id)
REFERENCES students(student_id);

#Exercise 9
SELECT m.mountain_range, p.peak_name, p.elevation
FROM peaks AS p
JOIN mountains AS m
ON p.mountain_id = m.id
WHERE m.mountain_range = 'Rila'
ORDER BY p.elevation DESC;

