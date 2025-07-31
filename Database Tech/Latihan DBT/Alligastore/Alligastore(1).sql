-- 1 
CREATE DATABASE `alligastore_database`; 

-- 2 
CREATE TABLE `orders` (
	OrderID CHAR(5) PRIMARY KEY CHECK (OrderID REGEXP '^BK[0-9]{3}$'), 
	CustomerID CHAR(5), 
    OrderDate DATE NOT NULL, 
    TotalAmount INT NOT NULL CHECK(TotalAmount >= 0),  
	FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE
); 

-- 3 
CREATE TABLE `orderitems`(
    OrderItemID CHAR(5) PRIMARY KEY CHECK (OrderItemID REGEXP '^OI[0-9]{3}$'),
    OrderID CHAR(5), 
    BookID CHAR(5),
    Quantity INT  NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (BookID) REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE
); 

-- 4 
ALTER TABLE books 
ADD CONSTRAINT PublicationYear CHECK (PublicationYear BETWEEN 1800 AND 2023);

-- 5 
INSERT INTO `orders`(`OrderID`, `CustomerID`, `OrderDate`, `TotalAmount`) 
VALUES 
('OD001','CU001','2023-07-26',4599), 
('OD002','CU002','2023-07-25',3250), 
('OD003','CU003','2023-07-24',1575), 
('OD004','CU004','2023-07-23',2730), 
('OD005','CU005','2023-07-22',5120);

INSERT INTO `orderitems`(`OrderItemID`, `OrderID`, `BookID`, `Quantity`) 
VALUES 
('OI001', 'OD001', 'BO001', 2),
('OI002', 'OD001', 'BO003', 1),
('OI003', 'OD002', 'BO002', 1),
('OI004', 'OD003', 'BO001', 1),
('OI005', 'OD003', 'BO003', 3),
('OI006', 'OD004', 'BO003', 2),
('OI007', 'OD005', 'BO001', 3),
('OI008', 'OD005', 'BO002', 2);

-- 6 
SELECT 
	b.Title AS "Title", 
    a.AuthorName AS "AuthorName", 
    b.ISBN AS "ISBN", 
    g.GenreName AS "GenreName",
    b.PublicationYear AS "PublicationYear"
FROM 
	`books` b
JOIN 
	genres g ON g.GenreID = b.GenreID
JOIN 
	authorsbooks ab ON ab.BookID = b.BookID
JOIN 
	`authors` a ON a.AuthorID = ab.AuthorID
WHERE 1 

-- 7 
UPDATE `books` b 
SET b.Price = b.Price * 1.1
WHERE PublicationYear < 2000;

-- 8 
SELECT 
	c.CustomerID AS "CustomerID", 
    CONCAT(c.FirstName," ", c.LastName) AS "FullName", 
    o.TotalAmount AS "TotalSpent"
FROM 
	`customers` c 
JOIN 
	`orders` o  ON o.CustomerID = c.CustomerID
WHERE 1

-- 9 
SELECT 
	b.BookID AS "BookID", 
    b.Title AS "BookTitle", 
    a.AuthorName AS "AuthorName", 
    g.GenreName AS "GenreName", 
    COUNT(oi.Quantity) AS "TotalOrders" 
FROM 
	`books` b 
JOIN 
	authorsbooks ab ON ab.BookID = b.BookID
JOIN 
	`authors` a ON a.AuthorID = ab.AuthorID
JOIN 
	`genres` g ON g.GenreID = b.GenreID
JOIN 
	orderitems oi ON oi.BookID = b.BookID
WHERE 
	g.GenreName = "Mystery"
GROUP BY 
	BookID;


-- 10 
SELECT * 
FROM 
    `orders` o 
WHERE 
    DATE_ADD(o.OrderDate, INTERVAL 5 DAY) > "2023-07-27";


-- 11
SELECT 
	B.Title AS "Title", 
    CONCAT(LEFT(b.ISBN, 3), SUBSTRING(a.AuthorName, POSITION(" " IN a.AuthorName)+1, 1), RIGHT(b.ISBN, 3)) AS "GeneratedCode"
FROM 
	`books` b 
JOIN 
	authorsbooks ab ON ab.BookID = b.BookID
JOIN 
	`authors` a ON a.AuthorID = ab.AuthorID
WHERE 1

-- 12
SELECT 
	CONCAT(MONTHNAME(O.OrderDate), " ", YEAR(O.OrderDate)) AS "Date", 
    SUM(O.TotalAmount) AS "TotalSales"
FROM 
	`orders` o 
WHERE MONTH(o.OrderDate) = 7;

-- 13 
SELECT 
	o.OrderID AS "OrderID", 
    DATE_FORMAT(DATE_ADD(o.OrderDate, INTERVAL 7 DAY), '%W, %M %D %Y') AS "	UpdateOrderDate"
FROM 
	`orders` o  
WHERE 1

-- 14 
DELETE o FROM `orders` o 
WHERE RIGHT(o.TotalAmount,1) = 0; 

-- 15 
DELETE o FROM `orders` o 
WHERE o.TotalAmount < 2000; 

-- 16
DROP DATABASE `alligastore_database`; 