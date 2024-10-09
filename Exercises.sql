#Exercise 0
CREATE database `minions`;
#Exercise 1
CREATE TABLE `minions`.`minions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`id`)); 
  
  CREATE TABLE `towns`(
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL);
#Exercise 2
  ALTER TABLE `minions` 
ADD COLUMN `town_id` INT NOT NULL AFTER `age`,
ADD INDEX `fk_townId_idx` (`town_id` ASC) VISIBLE;
;
ALTER TABLE `minions` 
ADD CONSTRAINT `fk_townId`
  FOREIGN KEY (`town_id`)
  REFERENCES `minions`.`towns` (`id`);
  
#Exercise 3
INSERT INTO `towns`
(`id`,`name`)
VALUES
(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna');

INSERT INTO `minions`
(`id`,`name`,`age`,`town_id`)
VALUES
(1,'Kevin',22,1),
(2,'Bob',15,3),
(3,'Steward',NULL,2);

#Exercise 4
TRUNCATE table `minions`;

#Exercise 5
DROP table `minions`;
DROP table `towns`;

#Exercise 6
CREATE table `people`(
`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
`name` VARCHAR(45) NOT NULL,
`picture` MEDIUMBLOB,
`height` DECIMAL(3,2),
`weight` DECIMAL(5,2),
`gender` CHAR NOT NULL,
`birthday` DATE NOT NULL,
`biography` TEXT);


INSERT INTO `people`
(`id`, `name`, `picture`, `height`,`weight`,`gender`,`birthday`,`biography`)
VALUES
(1, 'Vladimir', NULL,1.55, 65.42,'m','2001/12/10','A aspiring software engineer'),
(2, 'Pesho', NULL,1.65, 65.12,'m','2007/01/20','A aspiring QA'),
(3, 'Gosho', NULL,1.78, 76.42,'m','1999/01/10','Learning from others.'),
(4, 'Maria', NULL,1.60, 47.21,'f','2002/09/11','I am a trainee'),
(5, 'Sofia', NULL,1.70, 55.55,'f','2005/10/17','Cleaner by faith.');

#Exercise 7
CREATE table `users` (
`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
`username` VARCHAR(30) UNIQUE NOT NULL,
`password` VARCHAR(26) NOT NULL,
`profile_picture` MEDIUMBLOB,
`last_login_time_is_deleted` BOOLEAN);

INSERT INTO `users`
(`id`, `username`, `password`, `profile_picture`,`last_login_time_is_deleted`)
VALUES
(1, 'Goychev', '123456',478534685, true),
(2, 'Madfd23', 'Vx9qS',NULL,false),
(3, 'AAcczzII22', '12398756',NULL, false),
(4, 'AAzvr24', 'gfd3432',NULL, false),
(5, 'Vf923aas', '32493824',NULL, false);


ALTER TABLE `users`
ADD COLUMN `last_login_time` TIME AFTER `profile_picture`;

#Exercise 8
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT `pk_users` PRIMARY KEY(`id`,`username`);

#Exercise 9
ALTER TABLE `users`
MODIFY COLUMN `last_login_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

#Exercise 10
ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY(`id`),
ADD CONSTRAINT unique_username UNIQUE (username);

#Exercise 11
CREATE database movies;

CREATE table directors(
id INT NOT NULL,
director_name VARCHAR(45) NOT NULL,
notes TEXT);

CREATE table genres(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
genre_name VARCHAR(45) NOT NULL,
notes TEXT);

CREATE table categories(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
category_name VARCHAR(45) NOT NULL,
notes TEXT);

CREATE table movies(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
title VARCHAR(45) NOT NULL,
director_id INT,
copyright_year INT NOT NULL,
length TIME NOT NULL,
genre_id INT,
category_id INT,
rating DOUBLE (3,1),
notes TEXT);

ALTER TABLE `movies` 
ADD CONSTRAINT `fk_director`
  FOREIGN KEY (`director_id`)
  REFERENCES `directors` (`id`);
  
  ALTER TABLE `movies` 
ADD CONSTRAINT `fk_genre`
  FOREIGN KEY (`genre_id`)
  REFERENCES `genres` (`id`);
  
  ALTER TABLE `movies` 
ADD CONSTRAINT `fk_category`
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`id`);
  
  INSERT INTO `directors`
(`id`, `director_name`, `notes`)
VALUES
(1, 'Vladimir', 'Plain text.'),
(2, 'Gosho', 'A letter.'),
(3, 'Stefani',NULL),
(4, 'Georgi',NULL),
(5, 'Vanesa',NULL);

  INSERT INTO `genres`
(`id`, `genre_name`, `notes`)
VALUES
(1, 'Horror', 'Pretty scary movie!'),
(2, 'Romance', 'A movie about relationships & love.'),
(3, 'Comedy','Funny movie'),
(4, 'Fantasy',NULL),
(5, 'Historical',NULL);

  INSERT INTO `categories`
(`id`, `category_name`, `notes`)
VALUES
(1, '+18', 'A movie for adults.'),
(2, '+16', 'A movie for young adults.'),
(3, '+12', null),
(4, '+7',NULL),
(5, '+3',NULL);

INSERT INTO `movies`
(`id`, `title`, `director_id`, `copyright_year`,`length`, `genre_id`, `category_id`,`rating`,`notes`)
VALUES
(1, 'Scary Movie', 2, 2017, '10:30:54', 1, 2, 4.5, NULL),
(2, 'Funny Movie', 5,2016,'02:12:00', 3, 4, 10.0, NULL),
(3, 'Fantasy Movie', 1, 2024,'01:26:32', 4, 3, 9.5, NULL),
(4, 'Historical Movie',3,2024,'01:54:30', 5, 5, 6.5, NULL),
(5, 'Romance Movie', 2 ,2007, '01:12:20', 2, 1, 9.8, NULL);

#Exercise 12
CREATE database car_rental;

CREATE table categories(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
category VARCHAR(45) NOT NULL,
daily_rate DOUBLE(4,2) NOT NULL,
weekly_rate DOUBLE(5,2) NOT NULL,
monthly_rate DOUBLE(6,2) NOT NULL,
weekend_rate DOUBLE(5,2) NOT NULL);

CREATE table cars(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
plate_number VARCHAR(8) NOT NULL,
make VARCHAR(30) NOT NULL,
model VARCHAR(30) NOT NULL,
car_year INT NOT NULL,
category_id INT NOT NULL,
doors INT,
picture MEDIUMBLOB,
car_condition VARCHAR(10),
available BOOLEAN NOT NULL );

CREATE table employees(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
title VARCHAR(45) NOT NULL,
notes TEXT);

CREATE TABLE customers(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
driver_license_number INT,
full_name VARCHAR(45) NOT NULL,
address VARCHAR(55),
city VARCHAR(45) NOT NULL,
zip_code INT,
notes TEXT);

CREATE TABLE rental_orders(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
employee_id INT NOT NULL,
customer_id INT NOT NULL,
car_id INT NOT NULL,
car_condition VARCHAR(10),
tank_level VARCHAR(10) NOT NULL,
kilometrage_start INT NOT NULL,
kilometrage_end INT NOT NULL,
total_kilometrage INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_days INT NOT NULL,
rate_applied INT NOT NULL,
tax_rate DOUBLE(3,2),
order_status VARCHAR(45) NOT NULL,
notes TEXT);

ALTER TABLE `cars` 
ADD CONSTRAINT `fk_category`
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`id`);
  
  ALTER TABLE `rental_orders` 
ADD CONSTRAINT `fk_employee`
  FOREIGN KEY (`employee_id`)
  REFERENCES `employees` (`id`);
  
  ALTER TABLE `rental_orders` 
ADD CONSTRAINT `fk_customer`
  FOREIGN KEY (`customer_id`)
  REFERENCES `customers` (`id`);
  
  ALTER TABLE `rental_orders` 
ADD CONSTRAINT `fk_car`
  FOREIGN KEY (`car_id`)
  REFERENCES `cars` (`id`);
  
  
    INSERT INTO `categories`
(`id`, `category`, `daily_rate`, `weekly_rate`, `monthly_rate`,`weekend_rate`)
VALUES
(1, 'Vehicle', 20.00, 110.00, 1250.00, 100.00),
(2, 'Motorcycle',15.00, 101.00, 1000.00, 100.00 ),
(3, 'Truck', 50.00, 250.00, 2500.00, 150.00);

INSERT INTO `cars`
(`id`, `plate_number`, `make`, `model`, `car_year`,`category_id`, `doors`, `picture`, `car_condition`, `available`)
VALUES
(1, 'EH2056KX', 'Audi', 'A4', 2014, 1, 4, NULL, NULL, true),
(2, 'CA1000AA','VW', 'Golf', 1987, 1, 2, NULL , NULL, false),
(3, 'EHEHEHEH', 'Mercedes-Benz', 'GLS 450', 2012, 3, NULL, NULL, NULL, true);

INSERT INTO `employees`
(`id`, `first_name`, `last_name`, `title`, `notes`)
VALUES
(1, 'Vladimir', 'Goychev', 'CEO', NULL),
(2, 'Stoqn','Kapitanov', 'Cleaner', 'The best cleaner in town!'),
(3, 'Kaloqn', 'Ivanov', 'Manager', NULL);

INSERT INTO `customers`
(`id`, `full_name`, `city`)
VALUES
(1, 'Ivan Ivanov', 'Pleven'),
(2, 'Gosho Gosho','Sofia'),
(3, 'Hrisimir H.', 'Haskovo');

INSERT INTO `rental_orders`
(`id`, `employee_id`, `customer_id`, `car_id`, `tank_level`,`kilometrage_start`, `kilometrage_end`, `total_kilometrage`, `start_date`, `end_date`, `total_days`, `rate_applied`, `order_status`)
VALUES
(1, 1, 2, 1, 'Full', 205000, 210000, 5000, '2024/09/01', '2024/09/04', 3, 10, 'Completed'),
(2, 2,1, 2, 'Empty', 193000, 200000, 7000 , '2024/06/06', '2024/06/12', 6, 5, 'Completed'),
(3, 3, 3, 3, 'Half', 50000, 150000, 100000, '2024/06/01', '2024/09/01', 90, 50, 'Completed');

#Exercise 13
CREATE database hotel;

CREATE table employees(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
title VARCHAR(45) NOT NULL,
notes TEXT);

CREATE table customers(
account_number INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
phone_number VARCHAR(45),
emergency_name VARCHAR(45),
emergency_number VARCHAR(45),
notes TEXT);

CREATE table room_status(
room_status INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
notes TEXT);

CREATE table room_types(
room_type INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
notes TEXT
);

CREATE table bed_types(
bed_type INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
notes TEXT);

CREATE table rooms (
room_number INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
room_type INT NOT NULL,
bed_type INT NOT NULL,
rate DOUBLE(4,2),
room_status INT NOT NULL,
notes TEXT);

CREATE table payments(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
employee_id INT NOT NULL,
payment_date DATE,
account_number INT NOT NULL,
first_date_occupied DATE,
last_date_occupied DATE,
total_days INT NOT NULL,
amount_charged DECIMAL(5,2) NOT NULL,
tax_rate DECIMAL(4,2),
payment_total DECIMAL(5,2),
notes TEXT
);

CREATE table occupancies(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
employee_id INT NOT NULL,
date_occupied DATE NOT NULL,
account_number INT NOT NULL,
room_number INT NOT NULL,
rate_applied VARCHAR(45),
phone_charge DECIMAL(5,2),
notes TEXT);

ALTER TABLE rooms
ADD CONSTRAINT fk_room_type
FOREIGN KEY(room_type)
REFERENCES room_types (room_type);

ALTER TABLE rooms
ADD CONSTRAINT fk_bed_type
FOREIGN KEY(bed_type)
REFERENCES bed_types (bed_type);

ALTER TABLE rooms
ADD CONSTRAINT fk_room_status
FOREIGN KEY(room_status)
REFERENCES room_status (room_status);

ALTER TABLE payments
ADD CONSTRAINT fk_employee
FOREIGN KEY(employee_id)
REFERENCES employees (id);

ALTER TABLE payments
ADD CONSTRAINT fk_account_number
FOREIGN KEY(account_number)
REFERENCES customers (account_number);

#OCCUPANCIES LEFT










  