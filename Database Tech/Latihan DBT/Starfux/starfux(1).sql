-- 1
CREATE DATABASE `Starfuxpromo`;

-- 2 
CREATE TABLE `weeklypromo`(
	WeeklyPromoID CHAR(5) PRIMARY KEY CHECK (WeeklyPromoID REGEXP '^WP[0-1]{3}$'), 
    WeeklyPromoName VARCHAR(255) NOT NULL, 
    WeeklyPromoDay INT NOT NULL, 
    WeeklyPromoDiscount INT NOT NULL
);  

-- 3 
CREATE TABLE `SeasonalPromo` (
	SeasonalPromoID CHAR(5) PRIMARY KEY CHECK (SeasonalPromoID REGEXP '^SP[0-9]{3}$'), 
    SeasonalPromoName VARCHAR(255) NOT NULL, 
    SeasonalPromoStartDate DATE NOT NULL, 
    SeasonalPromoEndDate DATE NOT NULL CHECK (SeasonalPromoEndDate>SeasonalPromoStartDate), 
    SeasonalPromoDiscount INT NOT NULL
); 

-- 4
INSERT INTO `weeklypromo`(`WeeklyPromoID`, `WeeklyPromoName`, `WeeklyPromoDay`, `WeeklyPromoDiscount`) 
VALUES 
('WP001','TGIF', 5,50),
('WP002','Work Day', 1, 2);

INSERT INTO `seasonalpromo`(`SeasonalPromoID`, `SeasonalPromoName`, `SeasonalPromoStartDate`, `SeasonalPromoEndDate`, `SeasonalPromoDiscount`)
VALUES 
('SP001','Valentine Day','2021-02-14','2021-02-15',60),
('SP002','Spring Season Celebration','2021-03-18','2021-04-20',40), 
('SP003','Summer Opening','2021-06-21','2021-07-15',20),
('SP004','Mid Autumn Festival','2021-09-23','2021-10-10',30),
('SP005','Winter Festival','2021-12-20','2022-01-10',35);

-- 5 
SELECT 
	s.StaffID AS "StaffID",
    s.StaffName AS "StaffName", 
    s.StaffEmail as "StaffEmail", 
    REPLACE(s.StaffPhone, '08', '+62') AS "StaffPhone", 
    s.StaffGender AS "StaffGender", 
    s.StaffSalary AS "StaffSalary"
FROM 
	`staff` s
WHERE 
	s.StaffPosition LIKE "Barista"; 

-- 6
SELECT 
	s.StaffID AS "StaffID", 
    s.StaffName AS "StaffName", 
    s.StaffPosition AS "StaffPosition", 
    o.OrderID AS "OrderID", 
    o.OrderDate AS "OrderDate", 
    o.CustomerName AS "CustomerName", 
    GROUP_CONCAT(p.ProductName ORDER BY p.ProductName DESC) AS "Order" 
FROM 
	`staff` s 
JOIN 
	`order` o ON o.StaffID = s.StaffID
JOIN 
	`orderdetail` od ON  od.OrderID = o.OrderID
JOIN 
	`product` p ON p.ProductID = od.ProductID
WHERE 
	s.StaffPosition <> "Store Manager" AND DAYNAME(o.OrderDate) <> "Sunday"
GROUP BY o.OrderID
ORDER BY s.StaffID

-- 7
SELECT 
    o.OrderID AS "OrderID", 
    o.OrderDate AS "OrderDate", 
    o.CustomerName AS "CustomerName", 
    s.StaffName AS "StaffName", 
    s.StaffPosition AS "StaffPosition",
    sp.SeasonalPromoName AS "SeasonalPromoName", 
    CONCAT(sp.SeasonalPromoDiscount, '%') AS "SeasonalPromoDiscount"
FROM 
    `order` o
INNER JOIN
    staff s ON s.StaffID = o.StaffID
INNER JOIN 
    seasonalpromo sp ON (DATEDIFF(o.OrderDate, sp.SeasonalPromoStartDate) >= 0 AND DATEDIFF(sp.SeasonalPromoEndDate, o.OrderDate) >= 0)
WHERE 
    o.OrderType = 'Dine In' AND s.StaffPosition = 'Barista';

-- 8
UPDATE `staff` s
JOIN 
	`order` o ON o.StaffID = s.StaffID
SET 
	s.StaffSalary = s.StaffSalary + 50000
WHERE 
	o.OrderType = 'GoZek' OR o.OrderType = 'GrapPood';

-- 9
DELETE t FROM `topping` t
JOIN ordertoppingdetail otd ON otd.ToppingID = t.ToppingID
JOIN `order` o ON o.OrderID = otd.OrderID
WHERE DATE_FORMAT(O.OrderDate, '%M') = "July"; 

-- 10 
DROP DATABASE `Starfuxpromo`; 