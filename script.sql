-- SQL Script for FitTrack Database

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments` (
  `appointment_date` DATE DEFAULT NULL,
  `appointment_time` TIME DEFAULT NULL,
  `trainer_id` INT DEFAULT NULL,
  `member_id` INT DEFAULT NULL,
  `appointment_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`appointment_id`),
  KEY `trainer_id` (`trainer_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `memebers` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

INSERT INTO `appointments` VALUES 
('2024-01-15','10:00:00',1,3,11),
('2024-01-16','14:30:00',2,5,12),
('2024-01-17','09:00:00',3,7,13),
('2024-01-18','13:00:00',4,2,14),
('2024-01-19','15:00:00',5,6,15),
('2024-01-20','11:00:00',6,8,16),
('2024-01-22','08:00:00',8,4,17),
('2024-01-23','12:00:00',9,3,18),
('2024-01-24','17:00:00',10,2,19);

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `department_name` VARCHAR(50) DEFAULT NULL,
  `location` VARCHAR(100) DEFAULT NULL,
  `department_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

INSERT INTO `departments` VALUES 
('Front Desk','Main Lobby',1),
('Personal Training','Fitness Floor - West Wing',2),
('Group Classes','Studio A',3),
('Aquatics','Indoor Pool Area',4),
('Spa and Wellness','Wellness Center - Ground Floor',5),
('Nutrition Counseling','Office 101',6),
('Equipment Maintenance','Storage Room B2',7),
('Membership Services','Main Lobby - Office 2',8),
('Kids Zone','Family Center - East Wing',9),
('Management Office','Administrative Block',10),
('Musculation','Fitness Floor - West Wing',11),
('Cardio','Fitness Floor - East Wing',12);

DROP TABLE IF EXISTS `membership`;
CREATE TABLE `membership` (
  `member_id` INT DEFAULT NULL,
  `room_id` INT DEFAULT NULL,
  `start_date` DATE DEFAULT NULL,
  `membership_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`membership_id`),
  KEY `member_id` (`member_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `memebers` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

INSERT INTO `membership` VALUES 
(2,2,'2024-02-15',11),
(3,3,'2024-03-10',12),
(4,4,'2024-04-20',13),
(5,5,'2024-05-05',14),
(6,6,'2024-06-12',15),
(7,7,'2024-07-25',16),
(8,8,'2024-08-30',17),
(2,9,'2024-09-15',18),
(4,10,'2024-10-01',19),
(9,2,'2024-12-06',20);

DROP TABLE IF EXISTS `memebers`;
CREATE TABLE `memebers` (
  `first_name` VARCHAR(50) DEFAULT NULL,
  `last_name` VARCHAR(50) DEFAULT NULL,
  `gender` ENUM('male','female') DEFAULT NULL,
  `date_of_birth` DATE DEFAULT NULL,
  `phone_number` VARCHAR(15) DEFAULT NULL,
  `email` VARCHAR(100) DEFAULT NULL,
  `member_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO `memebers` VALUES 
('Alex','Johnson','male','1990-07-15','1234567890','alex.johnson@example.com',2),
('Maria','Gonzales','female','1985-03-22','9876543210','maria.gonzales@example.com',3),
('John','Doe','male','1992-11-05','4567891230',NULL,4),
('Emily','Smith','female','1995-06-10','7894561230','emily.smith@example.com',5),
('David','Brown','male','1988-01-19','3216549870',NULL,6),
('Sophia','Davis','female','1993-09-12','6547893210','sophia.davis@example.com',7),
('James','Wilson','male','1991-04-08','2589631470',NULL,8),
('Olivia','Garcia','female','1996-12-24','9632587410','olivia.garcia@example.com',9),
('Liam','Johnson','male','2003-05-15','9876543210','liam.johnson@example.com',10);

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `room_number` VARCHAR(10) DEFAULT NULL,
  `room_type` ENUM('Cardio','Weights','Studio') DEFAULT NULL,
  `capacity` INT DEFAULT NULL,
  `room_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO `rooms` VALUES 
('102','Studio',2,2),
('103','Weights',4,3),
('104','Studio',2,4),
('105','Cardio',1,5),
('201','Weights',1,6),
('202','Studio',4,7),
('203','Cardio',6,8),
('204','Studio',2,9),
('205','Weights',1,10);

DROP TABLE IF EXISTS `trainers`;
CREATE TABLE `trainers` (
  `first_name` VARCHAR(50) DEFAULT NULL,
  `last_name` VARCHAR(50) DEFAULT NULL,
  `specialization` VARCHAR(50) DEFAULT NULL,
  `department_id` INT DEFAULT NULL,
  `trainer_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`trainer_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `trainers_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

INSERT INTO `trainers` VALUES 
('John','Smith','Personal Training',2,1),
('Emma','Johnson','Yoga and Pilates',3,2),
('Michael','Brown','Aquatics',4,3),
('Sophia','Davis','Nutrition Counseling',6,4),
('Daniel','Wilson','Group Classes',3,5),
('Olivia','Taylor','Weightlifting',2,6),
('James','Anderson','Cardio and Endurance',2,7),
('Isabella','Martinez','Kids Fitness',9,8),
('Liam','Thomas','Rehabilitation Exercises',5,9),
('Ava','Harris','Dance Fitness',3,10),
('joshua','marcus','Cardio',12,11),
('mike','tuna','Musculation',11,12);

DROP TABLE IF EXISTS `workout_plans`;
CREATE TABLE `workout_plans` (
  `member_id` INT DEFAULT NULL,
  `trainer_id` INT DEFAULT NULL,
  `instructions` VARCHAR(255) DEFAULT NULL,
  `plan_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`plan_id`),
  KEY `member_id` (`member_id`),
  KEY `trainer_id` (`trainer_id`),
  CONSTRAINT `workout_plans_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `memebers` (`member_id`),
  CONSTRAINT `workout_plans_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

INSERT INTO `workout_plans` VALUES 
(3,1,'Cardio: 20 mins cycling\nCore: 3 sets of planks, sit-ups, and leg raises\nCooldown: 10 mins stretching',20),
(5,4,'Aquatics: 10 laps freestyle\nStrength: 3 sets of resistance band exercises\nCooldown: 5 mins swimming at a relaxed pace',21),
(7,3,'Group Class: Yoga (Sun Salutation sequence)\nStrength: Bodyweight exercises\nCooldown: Breathing exercises',22),
(2,6,'Weightlifting: 5 sets of bicep curls, tricep dips, and shoulder press\nCooldown: 5 mins light jogging',23),
(4,5,'Core: 4 sets of crunches, mountain climbers, and reverse crunches\nCardio: 10 mins elliptical machine\nCooldown: Light stretching',24),
(6,7,'Endurance: 30 mins treadmill at moderate pace\nCooldown: 10 mins walking',25),
(8,10,'Dance Fitness: 45 mins Zumba class\nCooldown: Relaxed dancing for 5 mins',26),
(3,8,'Rehabilitation: 5 sets of gentle stretching and light resistance exercises\nCooldown: Guided meditation for relaxation.',27);