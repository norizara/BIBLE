-- 1 Insert
INSERT INTO `transactiondetail`(`TransactionID`, `ProductID`, `Quantity`) 
VALUES 
('TR001','PR014',27),
('TR001','PR010',2),
('TR005','PR005',26),
('TR005','PR002',21); 

-- 2 Radian dan Random 
INSERT INTO `msproduct`(`ProductID`, `CategoryID`, `ProductName`, `ProductPrice`, `ProductStock`) 
VALUES 
('PR047','CT004','Wagyu Saikoro',12.99,ROUND(10 + RAND() * (50-10), 2)); 

-- 3 Tambah kolom
ALTER TABLE `mscustomer`
ADD `CustomerPhone` VARCHAR(50) NOT NULL;

-- 4 
ALTER TABLE `mscustomer`
ADD CONSTRAINT check_phonenumber CHECK(mscustomer.CustomerPhone REGEXP '^[0-9]*$');

-- 5 
DELETE t 
FROM `transactionheader` t 
WHERE t.TransactionID IN('TR001', 'TR003', 'TR005');

-- 6
UPDATE `msproduct` p
SET p.ProductPrice = p.ProductPrice - 2
WHERE p.ProductPrice >10;

-- 7 
UPDATE `mscustomer` c 
SET 
	c.CustomerName = CONCAT('Mrs.', c.CustomerName), 
	c.CustomerEmail = INSERT(c.CustomerEmail, LOCATE('@', c.CustomerEmail), 0, 'lady')
WHERE c.CustomerGender LIKE 'Female' AND TIMESTAMPDIFF(YEAR, c.CustomerDOB, CURRENT_DATE) > 20; 

-- 8 
SELECT 
	p.ProductID AS "ProductID", 
    p.ProductName AS "ProductName", 
    CONCAT('$', p.ProductPrice) AS "ProductPrice",
    c.CategoryName AS "Category Name"
FROM `msproduct` p 
JOIN mscategory c ON c.CategoryID = p.CategoryID
WHERE c.CategoryName IN ('Dairy','Meat');

-- 9 
SELECT DISTINCT
	e.EmployeeName AS "EmployeeName", 
    e.EmployeeAddress AS "EmployeeAddress"
FROM `msemployee` e 
JOIN transactionheader th ON th.EmployeeID = e.EmployeeID
JOIN mscustomer c ON c.CustomerID = th.CustomerID
WHERE c.CustomerGender = 'Female' AND MONTH(th.TransactionDate) = 12; 

