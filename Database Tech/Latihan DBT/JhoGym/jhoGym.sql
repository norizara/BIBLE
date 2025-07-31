CREATE DATABASE `jhogym`; 

-- 1
CREATE TABLE feedbacks (
	id CHAR(5) PRIMARY KEY CHECK (id REGEXP "^FB[0:9][0:9][0:9]"), 
    participant CHAR(5),
    class CHAR(5), 
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 10), 
    `comment` VARCHAR(300) NOT NULL CHECK (LENGTH(`comment`) > 50),
    `timestamps` DATETIME NOT NULL CHECK (`timestamps`< '2023-07-18'), 
    FOREIGN KEY (participant) REFERENCES participants(id) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY(class) REFERENCES classes(id) ON UPDATE CASCADE ON DELETE CASCADE
); 

-- 2 
INSERT INTO `trainers`(`id`, `name`, `gender`, `status`) 
VALUES 
('TR021','Sophia Adams','Female',1), 
('TR022','Ethan Williams','Male',1),
('TR023','Ava Johnson','Female',0),
('TR024','Noah Martinez','Male',1),
('TR025','Isabella Brown','Female',1); 

-- 3
SELECT CONCAT('Trainer ', RIGHT(trainers.id, 3)) as 'Trainer ID', trainers.name as 'Trainer Name' 
FROM `trainers` 
WHERE trainers.gender LIKE "MALE" AND trainers.status LIKE 0

-- 4 
SELECT participants.name AS "Participant Name", DATE_FORMAT(participants.joined_date, "%M %D, %Y") AS "Participant Date" 
FROM `participants` 
WHERE participants.gender = "Female" AND DATEDIFF("2022-12-31", participants.joined_date)>320

-- 5
SELECT classes.name AS "Class Name", CONCAT(classes.duration/60, " Hour(s)") AS "Class Duration" 
FROM `classes` 
WHERE classes.location LIKE "LO002"

-- 6 
SELECT classes.name AS "Class Name", FORMAT(classes.cost, 2) AS "Class Cost (in USD)" 
FROM `classes`
JOIN class_participants ON class_participants.class = classes.id
WHERE class_participants.present = 0

-- 7
UPDATE `classes` 
SET classes.cost = classes.cost * 1.1 
WHERE classes.duration > 270

-- 8
DELETE FROM `participants` 
WHERE DAY(participants.joined_date) LIKE "2023-07-20";
