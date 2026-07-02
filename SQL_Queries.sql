CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;


SELECT * FROM ecommerce_analysis;
SHOW databases;

-- SELECT
SELECT * FROM dataset;


-- WHERE
SELECT *
FROM dataset
WHERE CITY = 'DELHI' AND  Revenue > 10000;


-- ORDER BY
SELECT Product, Revenue
FROM Dataset
ORDER BY Revenue DESC;
  
  
-- GROUP BY
SELECT City,
SUM(Revenue) AS Total_Revenue
FROM Dataset
GROUP BY City; 


-- SUM
SELECT City,
SUM(Revenue) AS Total_Revenue
FROM Dataset
GROUP BY City; 


-- AVG
SELECT Category,
AVG(Price) AS Average_Price
FROM Dataset
GROUP BY Category;


-- SUBQUERY
SELECT Product,
Revenue
FROM Dataset
WHERE Revenue >
(
    SELECT AVG(Revenue)
    FROM Dataset
);


-- CREATE VIEW
CREATE VIEW City_Revenue AS
SELECT City,
SUM(Revenue) AS Total_Revenue
FROM Dataset
GROUP BY City;


-- DISPLAY VIEW
SELECT * FROM City_Revenue;


SELECT * FROM DATASET;


-- CREATE PRODUCT TABLE
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Product VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10,2)
);


-- INSERT DATA
INSERT INTO Products (Product, Category, Price)
SELECT DISTINCT Product, Category, Price
FROM Dataset;

SELECT * FROM Products;

-- ADD PRODUCTID
ALTER TABLE Dataset
ADD ProductID INT;

-- UPDATE PRODUCTID
UPDATE Dataset d
JOIN Products p
ON d.Product = p.Product
SET d.ProductID = p.ProductID;

-- INNER JOIN
SELECT d.OrderID, d.Date, d.City, p.Product, p.Category, p.Price,
 d.Quantity, d.Revenue
FROM Dataset d
INNER JOIN Products p
ON d.ProductID = p.ProductID;

--  LEFT JOIN
SELECT d.OrderID, d.Product, p.Category, p.Price
FROM Dataset d
LEFT JOIN Products p
ON d.ProductID = p.ProductID;

-- RIGHT JOIN
SELECT d.OrderID, d.Product, p.Category, p.Price
FROM Dataset d
RIGHT JOIN Products p
ON d.ProductID = p.ProductID;

-- CREATE INDEX
CREATE INDEX idx_city
ON Dataset(City(50));

CREATE INDEX idx_city
ON Dataset(City);

-- SHOW INDEX
SHOW INDEX FROM Dataset;




DESCRIBE DATASET;
DESCRIBE Products;

SET SQL_SAFE_UPDATES = 0;
-- SHOW tables;
-- SELECT DATABASE();