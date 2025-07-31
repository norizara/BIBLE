-- NB: Fokus dan Teliti ya JELVIS
-- 1 
CREATE DATABASE chatenraisemember; 

-- 2 
CREATE TABLE SubcriptionUser(
	SubcriptionTypeID CHAR(6) PRIMARY KEY CHECK (SubcriptionTypeID REGEXP '^SUB[0-9]{3}'),
    SubcriptionTypeName VARCHAR(100) NOT NULL, 
    DiscountPercentage INTEGER NOT NULL CHECK(DiscountPercentage > 0) 
); 

RENAME TABLE Subcriptionuser TO SubcriptionType;

-- 3
CREATE TABLE subcriptionuser(
	UserID CHAR(5) NOT NULL PRIMARY KEY CHECK (UserID REGEXP'CU[0-9]{3}'),
    SubcriptionTypeID CHAR(6) NOT NULL,
    StartDate DATE NOT NULL, 
    EndDate DATE NOT NULL,
    FOREIGN KEY (subcriptionTypeID) REFERENCES subcriptiontype(subcriptionTypeID) ON UPDATE CASCADE ON DELETE CASCADE
); 

-- 4
INSERT INTO `subcriptiontype`(`SubcriptionTypeID`, `SubcriptionTypeName`, `DiscountPercentage`) 
VALUES 
('SUB001','Epic',2),
('SUB002','Legend', 5),
('SUB003','Mythic',10);

INSERT INTO `subcriptionuser`(`UserID`, `SubcriptiontypeID`, `StartDate`, `EndDate`) 
VALUES 
('CU001','SUB001','2022-07-10','2023-01-10'),
('CU005','SUB002','2022-07-15','2023-10-10'),
('CU007','SUB003','2022-07-20','2023-07-10');

-- 5 
SELECT 
    mscake.CakeName AS "CakeName", mscake.CakeDescription AS "CakeDescription", mscake.CakePrice AS "CakePrice" 
FROM `mscake` 
WHERE  LENGTH(mscake.CakeDescription) - LENGTH(REPLACE(mscake.CakeDescription, ' ', '')) >= 3;

-- 6 
SELECT 
	mscustomer.CustomerName AS "CustomerName", 
    REPLACE(mscustomer.CustomerPhone, '08', '+62') AS "CustomerPhone", 
    msstaff.StaffName AS "StaffName", 
    msstaffposition.StaffPositionName AS "StaffPositionName", 
    DATE_FORMAT(mstransaction.TransactionDate, '%M') AS "TransactionDate"
FROM `mstransaction` 
JOIN mscustomer ON mscustomer.CustomerID = mstransaction.CustomerID
JOIN msstaff ON msstaff.StaffID = mstransaction.StaffID
JOIN msstaffposition ON msstaffposition.StaffPositionID = msstaff.StaffPositionID
WHERE LENGTH(mscustomer.CustomerName) - LENGTH(REPLACE(mscustomer.CustomerName, ' ', '')) >= 1 AND msstaff.StaffSalary > 2000000; 

-- 7
SELECT 
	mscustomer.CustomerName AS "CustomerName",
    subcriptiontype.SubcriptionTypeName AS "SubcriptionTypeName",
    mstransaction.TransactionDate AS "TransactionDate", 
    subcriptionuser.StartDate AS "StartDate", 
    subcriptionuser.EndDate AS "EndDate", 
    subcriptiontype.DiscountPercentage AS "DiscountPercentage"    
FROM `mstransaction`
JOIN mscustomer ON mscustomer.CustomerID = mstransaction.CustomerID
JOIN subcriptionuser on subcriptionuser.UserID = mscustomer.CustomerID
JOIN subcriptiontype ON subcriptiontype.SubcriptionTypeID = subcriptionuser.SubcriptionTypeID
WHERE subcriptiontype.SubcriptionTypeName IN ('Mythic', 'Legend') AND MONTH(mstransaction.TransactionDate) = 7;

-- 8
UPDATE `mscustomer` 
JOIN mstransaction ON mstransaction.CustomerID = mscustomer.CustomerID
SET mscustomer.CustomerName = "Erwin Setia Wijaya"
WHERE DATEDIFF('2022-08-10', mstransaction.TransactionDate) <= 2; 

-- 9 
DELETE FROM `msstaff` 
WHERE msstaff.StaffID IN (
    SELECT t.StaffID FROM `mstransaction` t 
    WHERE DATEDIFF(t.TransactionDate, "2022-06-10") = 30
); 

-- 10 
DROP DATABASE `chatenraisemember`; 
