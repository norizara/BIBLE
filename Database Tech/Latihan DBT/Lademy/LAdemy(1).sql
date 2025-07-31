-- 1 
CREATE DATABASE `lademy_subscription`; 

-- 2 
CREATE TABLE `subscription` (
    SubscriptionID CHAR(5) PRIMARY KEY CHECK (SubscriptionID REGEXP '^SC[0-9]{3}$'), 
    ParticipantId CHAR(5), 
    StartSubscription DATE NOT NULL, 
    EndSubscription DATE NOT NULL CHECK (DATEDIFF(EndSubscription, StartSubscription) >= 30),
    FOREIGN KEY (ParticipantID) REFERENCES participant(ParticipantID) ON UPDATE CASCADE ON DELETE CASCADE
); 

-- 3 
CREATE TABLE `membership` (
    MembershipID CHAR(5) PRIMARY KEY CHECK (MembershipID REGEXP '^ME[0-9]{3}$'), 
    participantID CHAR(5) NOT NULL, 
    MemberPoint INT CHECK (MemberPoint % 2 = 0), 
    JoinDate  DATE CHECK (YEAR(JoinDATE) < '2023')
); 

-- 4 
INSERT INTO `subscription`(`SubscriptionID`, `ParticipantId`, `StartSubscription`, `EndSubscription`) VALUES
('SC001','PT006','2021-05-09','2021-07-09'),
('SC002','PT001','2021-08-10','2022-01-10'), 
('SC003','PT009','2022-01-05','2022-03-05');

INSERT INTO `membership`(`MembershipID`, `participantID`, `MemberPoint`, `JoinDate`) 
VALUES 
('ME001','PT004',12,'2021-08-02'), 
('ME002','PT007',6,'2022-02-05'),
('ME003','PT005',20,'2022-04-07');

-- 5 
SELECT 
	c.CourseName AS "CourseName", 
    cc.CourseCategoryName AS "CourseCategoryName", 
    CONCAT('Rp ',c.CoursePrice ) AS "CoursePrice"
FROM 
	`course` c
INNER JOIN 
	coursecategory cc ON cc.CourseCategoryID = c.CourseCategoryID 
WHERE c.AmountOfSession >= 10; 

-- 6 
SELECT	
	p.ParticipantName AS "ParticipantName", 
    DATE_FORMAT(th.TransactionDate, '%M %D, %Y') AS "TransactionDate", 
    c.CourseName AS "CourseName"
FROM 
	`participant` p 
INNER JOIN 
	transactionheader th ON th.ParticipantID = p.ParticipantID
INNER JOIN 
	transactiondetail td ON td.TransactionID = th.TransactionID
INNER JOIN 
	course c ON c.CourseID = td.CourseID
WHERE LENGTH(c.CourseName) > 20  AND RIGHT(td.CourseID, 1) % 2 = 0;


-- 7 
SELECT 
	SUBSTR(p.ParticipantName, 1, POSITION(' ' IN p.ParticipantName)-1) AS "ParticipantName", 
    p.ParticipantEmail AS "ParticipantEmail", 
    p.ParticipantGender AS "ParticipantGender", 
    th.TransactionDate AS "TransactionDate", 
    m.MemberPoint AS "MemberPoint"    
FROM 
	`participant` p
JOIN
	transactionheader th ON th.ParticipantID = p.ParticipantID
JOIN
	membership m ON m.participantID = p.ParticipantID
WHERE 
	MONTH(th.TransactionDate) = 8 AND m.MemberPoint >= 15;  

-- 8 
UPDATE 
	`tutor` t
JOIN 
	course c ON c.CourseTutorID = t.TutorID
SET 
	t.TutorEmail = CONCAT(LEFT(t.TutorEmail, POSITION('@' IN t.TutorEmail)), '@lademy.co.id')
WHERE 
	c.CourseCategoryID = 'CRT04';

-- 9 
DELETE p FROM `participant` p
JOIN transactionheader th ON th.ParticipantID = p.ParticipantID
WHERE DAYNAME(th.TransactionDate) = 'Sunday';
 
-- 10
DROP DATABASE `lademy_subscription `; 