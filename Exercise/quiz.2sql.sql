-- --------------------------------------------------- Analysis of Database ------------------------------------------------
/*
Database Name --> Viviana_Mall

Tables -->

1.Stores(StoreID,StoreName,Category,Floor,Phone,Email,OpenTime,CloseTime,OwnerName,IsActive)
2.Employees(EmpID,Name,Age,Gender,Phone,Email,Designation,Salary,JoinDate,StoreID)
3.Customers (CustomerID,FullName,Gender,Age,Phone,Email,City,Membership,JoinDate,Points)
4.Products (ProductID,ProductName,Category,Brand,Price,Quantity,StoreID,IsAvailable,ManufactureDate,ExpiryDate)
5.Sales (SaleID,ProductID,CustomerID,StoreID,Quantity,TotalAmount,SaleDate,PaymentMethod,Discount,EmployeeID)

*/
   
   -- ---------------------------------------- Database queries ---------------------------------------------------------
-- create a database Viviana_Mall
create database Viviana_Mall;

-- to work on database, you need to use it first
use Viviana_Mall;

-- --------------------------------------------------------- Table Queries ----------------------------------------------
  
-- 1. Stores
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Category VARCHAR(50),
    Floor INT,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    OpenTime TIME,
    CloseTime TIME,
    OwnerName VARCHAR(100),
    IsActive BOOLEAN
);

-- Insert records into 'Stores'
INSERT INTO Stores(StoreID,StoreName,Category,Floor,Phone,Email,OpenTime,CloseTime,OwnerName,IsActive) VALUES
(1, 'Zara', 'Clothing', 1, '9876543210', 'zara@mall.com', '10:00:00', '21:00:00', 'John Smith', TRUE),
(2, 'Nike', 'Footwear', 2, '9876543211', 'nike@mall.com', '10:00:00', '21:00:00', 'Mike Jordan', TRUE),
(3, 'Starbucks', 'Cafe', 1, '9876543212', 'starbucks@mall.com', '08:00:00', '22:00:00', 'Sara Latte', TRUE),
(4, 'Croma', 'Electronics', 3, '9876543213', 'croma@mall.com', '10:00:00', '21:00:00', 'Alan Watts', TRUE),
(5, 'H&M', 'Clothing', 2, '9876543214', 'hm@mall.com', '10:00:00', '21:00:00', 'Lucy Gray', TRUE),
(6, 'Subway', 'Food', 1, '9876543215', 'subway@mall.com', '10:00:00', '22:00:00', 'Tom Toast', TRUE),
(7, 'Reliance Digital', 'Electronics', 3, '9876543216', 'reliance@mall.com', '10:00:00', '21:00:00', 'Anil Ambani', TRUE),
(8, 'Domino\'s', 'Food', 1, '9876543217', 'dominos@mall.com', '11:00:00', '23:00:00', 'Tony Cheese', TRUE),
(9, 'Puma', 'Footwear', 2, '9876543218', 'puma@mall.com', '10:00:00', '21:00:00', 'Rick Runner', TRUE),
(10, 'Tanishq', 'Jewelry', 3, '9876543219', 'tanishq@mall.com', '10:00:00', '21:00:00', 'Goldie Locks', TRUE);

-- to display table data
select * from Stores;

-- to remove complete record from table
truncate table Stores;

-- to remove complete records and attributes from table
drop table Stores;

-- 1. Add a new column to track store ratings
ALTER TABLE Stores ADD Rating DECIMAL(3,2);

-- 2. Rename a column
ALTER TABLE Stores RENAME COLUMN OwnerName TO ManagerName;

-- 3. Drop the rating column
ALTER TABLE Stores DROP COLUMN Rating;

-- 4. Create a backup table of stores
CREATE TABLE Store_Backup AS SELECT * FROM Stores;

-- 5. Change data type of Phone number
ALTER TABLE Stores MODIFY Phone VARCHAR(20);

set SQL_SAFE_UPDATES = 0;

-- 6. Update store status to inactive if they open after 11 AM
UPDATE Stores SET IsActive = FALSE WHERE OpenTime > '11:00:00';

-- 7. Insert a new store record
INSERT INTO Stores VALUES (11, 'Apple Store', 'Electronics', 3, '9876543220', 'apple@mall.com', '10:00:00', '22:00:00', 'Steve Mac', TRUE);

-- 8. Delete stores on 3rd floor
DELETE FROM Stores WHERE Floor = 3;

-- 9.
ALTER TABLE Employees DROP FOREIGN KEY employees_ibfk_1;

SET SQL_SAFE_UPDATES = 0;
-- Execute your UPDATE or DELETE statement
SET SQL_SAFE_UPDATES = 1; 
-- 10. Update manager name using a CASE condition
UPDATE Stores
SET ManagerName = CASE
    WHEN StoreName = 'Nike' THEN 'Jordan Smith'
    WHEN StoreName = 'Puma' THEN 'Perry Runner'
    ELSE ManagerName
END;

-- 11. List all stores on 1st floor
SELECT * FROM Stores WHERE Floor = 1;

-- 12. Find stores with email ending in '@mall.com'
SELECT StoreName FROM Stores WHERE Email LIKE '%@mall.com';

-- 13. Count of stores by category
SELECT Category, COUNT(*) AS TotalStores FROM Stores GROUP BY Category;

-- 14. Find earliest opening store
SELECT StoreName, OpenTime FROM Stores ORDER BY OpenTime ASC LIMIT 1;

-- 15. List only active stores with alias
SELECT StoreName AS `Store`, ManagerName AS `Manager` FROM Stores WHERE IsActive = TRUE;

-- 16. Find stores on floor 1 or 2 with BETWEEN
SELECT * FROM Stores WHERE Floor BETWEEN 1 AND 2;

-- 17. Show stores NOT in Clothing or Footwear
SELECT * FROM Stores WHERE Category NOT IN ('Clothing', 'Footwear');

-- 18. Find stores where name starts with 'S'
SELECT * FROM Stores WHERE StoreName LIKE 'S%';

-- 19. Aggregate and filter using HAVING
SELECT Floor, COUNT(*) AS StoreCount FROM Stores GROUP BY Floor HAVING COUNT(*) > 2;

-- 20. Use CASE in SELECT
SELECT StoreName,
       CASE
           WHEN Category = 'Food' THEN 'Eatery'
           WHEN Category = 'Clothing' THEN 'Apparel'
           ELSE 'Others'
       END AS StoreType
FROM Stores;

-- 21. Start transaction and rollback
START TRANSACTION;
DELETE FROM Stores WHERE Category = 'Cafe';
ROLLBACK;

-- 22. Start transaction and commit
START TRANSACTION;
UPDATE Stores SET IsActive = FALSE WHERE Category = 'Food';
COMMIT;

-- 23. Find storeid fron stores
select * from Stores where StoreID = 7;

-- 24.-- 23. Find storeid fron stores
select * from Stores where StoreID = 10;

-- 25. Create a view for active stores
CREATE VIEW ActiveStores AS
SELECT StoreName, Category, Floor
FROM Stores
WHERE IsActive = TRUE;

-- 26. Find storename fron stores
select * from Stores where StoreName =' Zara';

-- 27. Stores on the highest floor
SELECT * FROM Stores WHERE Floor = (SELECT MAX(Floor) FROM Stores);

-- 28. Stores with the same opening time as 'Zara'
SELECT * FROM Stores
WHERE OpenTime = (SELECT OpenTime FROM Stores WHERE StoreName = 'Zara');

-- 29. CTE to list store floor count
WITH FloorCount AS (
    SELECT Floor, COUNT(*) AS StoreCount
    FROM Stores
    GROUP BY Floor
)
SELECT * FROM FloorCount WHERE StoreCount >= 2;

-- 30. Function to check if a store is open for more than 10 hours
DELIMITER //
CREATE FUNCTION StoreOpenLong(OpenTime TIME, CloseTime TIME) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(HOUR, OpenTime, CloseTime) > 10;
END;
//
DELIMITER ;

-- 31. Use the function
SELECT StoreName FROM Stores
WHERE StoreOpenLong(OpenTime, CloseTime);

-- 32. Procedure to deactivate a store by ID
DELIMITER //
CREATE PROCEDURE DeactivateStore(IN sid INT)
BEGIN
   UPDATE Stores SET IsActive = FALSE WHERE StoreID = sid;
END;
//
DELIMITER ;

-- 33. Call the procedure
CALL DeactivateStore(4);

-- 34. View for Food-related stores
CREATE VIEW FoodStores AS
SELECT StoreID, StoreName FROM Stores WHERE Category = 'Food';

-- 35. Count stores by open hour range
SELECT HOUR(OpenTime) AS Hour, COUNT(*) AS CountByHour
FROM Stores
GROUP BY HOUR(OpenTime);

-- 36. Find managers whose stores close after 9 PM
SELECT ManagerName FROM Stores WHERE CloseTime > '21:00:00';

-- 37. Show active clothing stores on floor 2
SELECT * FROM Stores WHERE IsActive = TRUE AND Category = 'Clothing' AND Floor = 2;

-- 38. Convert store open-close time into total hours open
SELECT StoreName, TIMESTAMPDIFF(HOUR, OpenTime, CloseTime) AS HoursOpen FROM Stores;

-- 39. Extract domain from email
SELECT StoreName, SUBSTRING_INDEX(Email, '@', -1) AS Domain FROM Stores;

-- 40. Assume store_added DATE, show how many days old
ALTER TABLE Stores ADD store_added DATETIME DEFAULT CURRENT_TIMESTAMP;

-- 41. Query how many days since added
SELECT StoreName, DATEDIFF(CURDATE(), store_added) AS DaysSinceAdded FROM Stores;

-- 42. Most common category
SELECT Category, COUNT(*) AS Count FROM Stores GROUP BY Category ORDER BY Count DESC LIMIT 1;

-- 43. Store with second earliest opening
SELECT * FROM Stores WHERE OpenTime = (
    SELECT MIN(OpenTime) FROM Stores
    WHERE OpenTime > (SELECT MIN(OpenTime) FROM Stores)
);

-- 44. -- 26. Find storename fron stores
select * from Stores where StoreName ='Croma';

-- 45. Find storename fron stores
select * from Stores where StoreName ='Nike';

-- 46. Find storename fron stores
select * from Stores where StoreName ='Subway';

-- 47. Transaction with logic
START TRANSACTION;
UPDATE Stores SET IsActive = FALSE WHERE Category = 'Jewelry';
-- If no rows affected, rollback
ROLLBACK;

-- 48. Add check constraint for floor
ALTER TABLE Stores ADD CONSTRAINT chk_floor CHECK (Floor BETWEEN 1 AND 5);

-- 49. Rank stores by floor using window function (MySQL 8+)
SELECT StoreName, Floor, RANK() OVER(PARTITION BY Floor ORDER BY StoreName) AS FloorRank FROM Stores;

-- 50. Rank stores by floor using window function (MySQL 8+)
SELECT StoreName, Floor, RANK() OVER(PARTITION BY Floor ORDER BY StoreName) AS FloorRank FROM Stores;


-- 2. Employees
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Designation VARCHAR(50),
    Salary DECIMAL(10,2),
    JoinDate DATE,
    StoreID INT,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- Insert records into 'Employees'
INSERT INTO Employees(EmpID,Name,Age,Gender,Phone,Email,Designation,Salary,JoinDate,StoreID) VALUES
(1, 'Raj Mehta', 28, 'Male', '9123456781', 'raj@mall.com', 'Manager', 45000, '2021-01-15', 1),
(2, 'Simran Kaur', 25, 'Female', '9123456782', 'simran@mall.com', 'Cashier', 25000, '2022-05-10', 2),
(3, 'Ali Khan', 30, 'Male', '9123456783', 'ali@mall.com', 'Barista', 22000, '2021-11-20', 3),
(4, 'Sneha Roy', 26, 'Female', '9123456784', 'sneha@mall.com', 'Sales Rep', 27000, '2022-01-05', 4),
(5, 'John Paul', 35, 'Male', '9123456785', 'john@mall.com', 'Supervisor', 32000, '2020-07-17', 5),
(6, 'Neha Sharma', 29, 'Female', '9123456786', 'neha@mall.com', 'Sales Rep', 26000, '2022-03-22', 6),
(7, 'Vikram Joshi', 31, 'Male', '9123456787', 'vikram@mall.com', 'Technician', 40000, '2021-08-19', 7),
(8, 'Anjali Desai', 24, 'Female', '9123456788', 'anjali@mall.com', 'Cashier', 24000, '2023-02-11', 8),
(9, 'Karan Patel', 27, 'Male', '9123456789', 'karan@mall.com', 'Sales Rep', 28000, '2021-09-01', 9),
(10, 'Meera Nair', 33, 'Female', '9123456790', 'meera@mall.com', 'Manager', 48000, '2020-06-30', 10);

-- to display table data
select * from Employees;

-- to remove complete records from table
truncate table Employees;

-- to remove complete records and attributes from table
drop table Employees;

-- 1. Add a column to track employee performance rating
ALTER TABLE Employees ADD PerformanceRating INT;

-- 2. Modify salary precision
ALTER TABLE Employees MODIFY Salary DECIMAL(12,2);

-- 3. Rename column 'Name' to 'FullName'
ALTER TABLE Employees RENAME COLUMN Name TO FullName;

-- 4. Drop performance rating column
ALTER TABLE Employees DROP COLUMN PerformanceRating;

-- 5. Create a backup of Employees table
CREATE TABLE Employees_Backup AS SELECT * FROM Employees;

-- 6. Give a 10% raise to all managers
UPDATE Employees SET Salary = Salary * 1.10 WHERE Designation = 'Manager';

-- 7. Insert a new employee
INSERT INTO Employees VALUES
(11, 'Rohit Shetty', 32, 'Male', '9123456791', 'rohit@mall.com', 'Manager', 50000, '2023-01-10', 2);

-- 8. Delete all cashiers who joined before 2022
DELETE FROM Employees WHERE Designation = 'Cashier' AND JoinDate < '2022-01-01';

-- 9. Copy employees to backup
INSERT INTO Employees_Backup SELECT * FROM Employees;

-- 10. Increase salary based on role using CASE
UPDATE Employees
SET Salary = CASE
    WHEN Designation = 'Cashier' THEN Salary + 2000
    WHEN Designation = 'Manager' THEN Salary + 5000
    ELSE Salary + 1500
END;

-- 11. Find employees working at store ID 3
SELECT * FROM Employees WHERE StoreID = 3;

-- 12. Show names of employees with email from 'mall.com'
SELECT FullName FROM Employees WHERE Email LIKE '%@mall.com';

-- 13. Total salary expenditure by designation
SELECT Designation, SUM(Salary) AS TotalSalary FROM Employees GROUP BY Designation;

-- 14. Get employee with earliest join date
SELECT * FROM Employees ORDER BY JoinDate ASC LIMIT 1;

-- 15. Show top 3 highest paid employees
SELECT * FROM Employees ORDER BY Salary DESC LIMIT 3;

-- 16. Employees aged between 25 and 30
SELECT * FROM Employees WHERE Age BETWEEN 25 AND 30;

-- 17. Employees not in 'Sales Rep' or 'Cashier'
SELECT * FROM Employees WHERE Designation NOT IN ('Sales Rep', 'Cashier');

-- 18. Search by partial name
SELECT * FROM Employees WHERE FullName LIKE 'S%';

-- 19. Designation count with HAVING
SELECT Designation, COUNT(*) AS Count FROM Employees GROUP BY Designation HAVING Count >= 2;

-- 20. Use CASE to classify employees by salary
SELECT FullName, Salary,
CASE
    WHEN Salary >= 45000 THEN 'High'
    WHEN Salary >= 30000 THEN 'Medium'
    ELSE 'Low'
END AS SalaryBracket
FROM Employees;

-- 21. Start transaction, update and rollback
START TRANSACTION;
UPDATE Employees SET Salary = Salary * 1.20 WHERE Designation = 'Sales Rep';
ROLLBACK;

-- 22. Start transaction, update and commit
START TRANSACTION;
UPDATE Employees SET Salary = Salary + 1000 WHERE Designation = 'Cashier';
COMMIT;

-- 23. Find employees working at store ID 9
SELECT * FROM Employees WHERE StoreID = 9;

-- 24. Find employees working at store ID 10
SELECT * FROM Employees WHERE StoreID = 10;

-- 25. View of female employees earning above 30000
CREATE VIEW HighPaidFemales AS
SELECT FullName, Salary FROM Employees
WHERE Gender = 'Female' AND Salary > 30000;

-- 26. Find employees working at salary 
SELECT * FROM Employees WHERE Salary = 45000;

-- 27. Find employees working at salary
SELECT * FROM Employees WHERE Salary = 25000;

-- 28. Employees with salary equal to max salary
SELECT * FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- 29. Employees working in store with most employees
SELECT * FROM Employees
WHERE StoreID = (
    SELECT StoreID FROM Employees
    GROUP BY StoreID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 30. CTE to show average salary per store
WITH AvgSalary AS (
    SELECT StoreID, AVG(Salary) AS AvgSal FROM Employees GROUP BY StoreID
)
SELECT * FROM AvgSalary WHERE AvgSal > 30000;

-- 31. Create function to calculate annual salary
DELIMITER //
CREATE FUNCTION AnnualSalary(monthly DECIMAL(10,2)) RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  RETURN monthly * 12;
END;
//
DELIMITER ;

-- 32. Use the function
SELECT FullName, Salary, AnnualSalary(Salary) AS Annual FROM Employees;

-- 33. Create procedure to increase salary of a given designation
DELIMITER //
CREATE PROCEDURE RaiseSalary(IN role VARCHAR(50), IN increment DECIMAL(10,2))
BEGIN
  UPDATE Employees SET Salary = Salary + increment WHERE Designation = role;
END;
//
DELIMITER ;

-- 34. Call the procedure
CALL RaiseSalary('Technician', 2500);

-- 35. View to show total salary per store
CREATE VIEW StoreWiseSalary AS
SELECT StoreID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY StoreID;

-- 36. List all male managers
SELECT * FROM Employees WHERE Gender = 'Male' AND Designation = 'Manager';

-- 37. Employees whose name ends with 'a'
SELECT * FROM Employees WHERE FullName LIKE '%a';

-- 38. Show join year of each employee
SELECT FullName, YEAR(JoinDate) AS JoinYear FROM Employees;

-- 39. Get domain from email
SELECT FullName, SUBSTRING_INDEX(Email, '@', -1) AS EmailDomain FROM Employees;

-- 40. Round off salary to nearest 1000
SELECT FullName, ROUND(Salary, -3) AS RoundedSalary FROM Employees;

-- 41. Rank employees by salary within each designation
SELECT FullName, Designation, Salary,
       RANK() OVER(PARTITION BY Designation ORDER BY Salary DESC) AS RankBySalary
FROM Employees;

-- 42. Procedure to deactivate lowest paid employee
DELIMITER //
CREATE PROCEDURE DeactivateLowestPaid()
BEGIN
  DELETE FROM Employees
  WHERE Salary = (SELECT MIN(Salary) FROM Employees);
END;
//
DELIMITER ;

-- 43. Find employees working at salary
SELECT * FROM Employees WHERE Salary = 28000;

-- 44. Add age constraint
ALTER TABLE Employees ADD CONSTRAINT chk_age CHECK (Age BETWEEN 18 AND 60);

-- 45. Employees who joined in last 2 years and earn > 30000
SELECT * FROM Employees
WHERE JoinDate >= CURDATE() - INTERVAL 2 YEAR AND Salary > 30000;

-- 46. Show each employee with store name via subquery
SELECT FullName,
       (SELECT StoreName FROM Stores WHERE StoreID = Employees.StoreID) AS Store
FROM Employees;

-- 47. Find employees working at salary
SELECT * FROM Employees WHERE Salary = 40000;

-- 48. Find employees working at salary
SELECT * FROM Employees WHERE Salary = 24000;

-- 49. - 32. Use the function
SELECT FullName, Salary AS Annual FROM Employees;

-- 50. Find employees working at store ID 2
SELECT * FROM Employees WHERE StoreID = 2;

-- 3. Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50),
    Membership VARCHAR(20),
    JoinDate DATE,
    Points INT
);

-- Insert records into 'Customers'
INSERT INTO Customers (CustomerID,FullName,Gender,Age,Phone,Email,City,Membership,JoinDate,Points)VALUES
(1, 'Amit Jain', 'Male', 34, '9000000001', 'amit@gmail.com', 'Mumbai', 'Gold', '2021-03-10', 1500),
(2, 'Riya Sen', 'Female', 29, '9000000002', 'riya@gmail.com', 'Thane', 'Silver', '2022-06-21', 800),
(3, 'Ramesh Rao', 'Male', 45, '9000000003', 'ramesh@gmail.com', 'Navi Mumbai', 'Platinum', '2020-11-12', 2200),
(4, 'Neeta Shah', 'Female', 38, '9000000004', 'neeta@gmail.com', 'Pune', 'Gold', '2021-07-08', 1400),
(5, 'Sahil Khan', 'Male', 22, '9000000005', 'sahil@gmail.com', 'Mumbai', 'Silver', '2023-01-25', 500),
(6, 'Priya Iyer', 'Female', 31, '9000000006', 'priya@gmail.com', 'Mumbai', 'Gold', '2022-04-17', 1200),
(7, 'Manoj Dubey', 'Male', 40, '9000000007', 'manoj@gmail.com', 'Nashik', 'Platinum', '2019-09-05', 2500),
(8, 'Ayesha Sheikh', 'Female', 27, '9000000008', 'ayesha@gmail.com', 'Thane', 'Silver', '2023-02-14', 600),
(9, 'Dev Mehra', 'Male', 35, '9000000009', 'dev@gmail.com', 'Pune', 'Gold', '2021-12-01', 1350),
(10, 'Kavita Das', 'Female', 30, '9000000010', 'kavita@gmail.com', 'Mumbai', 'Silver', '2022-08-09', 950);

-- to display table data
select * from Customers;

-- to remove complete records from table
truncate table Customers;

-- to remove complete records and attributes from table
drop table Customers;

-- 1. Add a column to track last purchase date
ALTER TABLE Customers ADD LastPurchaseDate DATE;

-- 2. Add a check constraint for points
ALTER TABLE Customers ADD CONSTRAINT chk_points CHECK (Points >= 0);

-- 3. Rename column 'FullName' to 'CustomerName'
ALTER TABLE Customers RENAME COLUMN FullName TO CustomerName;

-- 4. Modify Membership column to increase length
ALTER TABLE Customers MODIFY Membership VARCHAR(30);

-- 5. Create a backup table
CREATE TABLE Customers_Backup AS SELECT * FROM Customers;

-- 6. Delete customers with less than 500 points
DELETE FROM Customers WHERE Points < 400;

-- 7. Update points for Mumbai customers
UPDATE Customers SET Points = Points + 100 WHERE City = 'Mumbai';

-- 8. Delete customers with less than 500 points
DELETE FROM Customers WHERE Points < 500;

-- 9. Copy data to backup table
INSERT INTO Customers_Backup SELECT * FROM Customers;

-- 10. Reset points for customers who joined before 2020
UPDATE Customers SET Points = 0 WHERE JoinDate < '2020-01-01';

-- 11. Select all gold members
SELECT * FROM Customers WHERE Membership = 'Gold';

-- 12. Get top 3 customers with highest points
SELECT * FROM Customers ORDER BY Points DESC LIMIT 3;

-- 13. Count customers by city
SELECT City, COUNT(*) AS TotalCustomers FROM Customers GROUP BY City;

-- 14. Find average age of customers
SELECT AVG(Age) AS AverageAge FROM Customers;

-- 15. Customers who joined in 2022
SELECT * FROM Customers WHERE YEAR(JoinDate) = 2022;

-- 16. Customers aged between 25 and 35
SELECT * FROM Customers WHERE Age BETWEEN 25 AND 35;

-- 17. Customers not from Mumbai or Pune
SELECT * FROM Customers WHERE City NOT IN ('Mumbai', 'Pune');

-- 18. Find customers whose name starts with 'A'
SELECT * FROM Customers WHERE CustomerName LIKE 'A%';

-- 19. Use CASE to classify loyalty level
SELECT CustomerName, Points,
  CASE
    WHEN Points >= 2000 THEN 'Elite'
    WHEN Points >= 1000 THEN 'Loyal'
    ELSE 'New'
  END AS LoyaltyLevel
FROM Customers;

-- 20. Use UPPER and SUBSTRING
SELECT UPPER(CustomerName) AS NameCaps,
       SUBSTRING(Email, 1, 5) AS EmailPrefix
FROM Customers;

-- 21. Start transaction and rollback
START TRANSACTION;
UPDATE Customers SET Points = Points - 100 WHERE Membership = 'Silver';
ROLLBACK;

-- 22. Start transaction and commit
START TRANSACTION;
UPDATE Customers SET Points = Points + 250 WHERE Membership = 'Gold';
COMMIT;

-- 23.Select all silver members
SELECT * FROM Customers WHERE Membership = 'Silver';

-- 24. Select all platinum members
SELECT * FROM Customers WHERE Membership = 'Platinum';

-- 25. Create view for Platinum members in Mumbai
CREATE VIEW PlatinumMumbai AS
SELECT CustomerName, Email, Points
FROM Customers
WHERE Membership = 'Platinum' AND City = 'Mumbai';

-- 26. Select age from customer
SELECT * FROM Customers WHERE Age = 45;

-- 27. Select age from customer
SELECT * FROM Customers WHERE Age = 40;

-- 28. Select age from customer
SELECT * FROM Customers WHERE Age = 30;

-- 29.Select age from customer
SELECT * FROM Customers WHERE Age = 35;

-- 30. Customers with above-average points
SELECT * FROM Customers
WHERE Points > (SELECT AVG(Points) FROM Customers);

-- 31. Customers who haven’t made any purchase
SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Sales);

-- 32. Rank customers by points in each city
WITH RankedCustomers AS (
  SELECT CustomerID, CustomerName, City, Points,
         RANK() OVER(PARTITION BY City ORDER BY Points DESC) AS RankInCity
  FROM Customers
)
SELECT * FROM RankedCustomers WHERE RankInCity <= 2;

-- 33. Procedure to reset points for a specific city
DELIMITER //
CREATE PROCEDURE ResetPoints(IN cityName VARCHAR(50))
BEGIN
  UPDATE Customers SET Points = 0 WHERE City = cityName;
END;
//
DELIMITER ;

-- 34. Call the procedure
CALL ResetPoints('Nashik');

-- 35. View of average points by membership level
CREATE VIEW AvgPointsByMembership AS
SELECT Membership, AVG(Points) AS AvgPoints
FROM Customers
GROUP BY Membership;

-- 36. Cities with more than 2 customers
SELECT City, COUNT(*) AS Total FROM Customers
GROUP BY City
HAVING Total > 2;

-- 37. Extract join year
SELECT CustomerName, YEAR(JoinDate) AS JoinYear FROM Customers;

-- 38. Get domain from email
SELECT CustomerName, SUBSTRING_INDEX(Email, '@', -1) AS EmailDomain FROM Customers;

-- 39. Round off points to nearest 100
SELECT CustomerName, ROUND(Points, -2) AS RoundedPoints FROM Customers;

-- 40. Customers labeled by tenure
SELECT CustomerName, JoinDate,
  CASE
    WHEN JoinDate < '2020-01-01' THEN 'Old'
    WHEN JoinDate BETWEEN '2020-01-01' AND '2022-12-31' THEN 'Regular'
    ELSE 'New'
  END AS TenureCategory
FROM Customers;

-- 41. Show each customer with their latest purchase (if Sales table exists)
SELECT CustomerName,
       (SELECT MAX(SaleDate) FROM Sales WHERE Sales.CustomerID = Customers.CustomerID) AS LastPurchase
FROM Customers;

-- 42. Select age from customer
SELECT * FROM Customers WHERE Age = 42;

-- 43. Points to INR value alias
SELECT CustomerName, Points AS LoyaltyPoints, Points * 0.2 AS INR_Value FROM Customers;

-- 44. Customers who are female, silver members, and joined after 2022
SELECT * FROM Customers
WHERE Gender = 'Female' AND Membership = 'Silver' AND JoinDate > '2022-01-01';

-- 45. Procedure to promote members based on points
DELIMITER //
CREATE PROCEDURE PromoteMembers()
BEGIN
  UPDATE Customers
  SET Membership = CASE
    WHEN Points >= 2000 THEN 'Platinum'
    WHEN Points >= 1000 THEN 'Gold'
    ELSE 'Silver'
  END;
END;
//
DELIMITER ;

-- 46. Call procedure
CALL PromoteMembers();

-- 47. Update last purchase date from Sales
UPDATE Customers c
JOIN (
  SELECT CustomerID, MAX(SaleDate) AS Latest FROM Sales GROUP BY CustomerID
) s ON c.CustomerID = s.CustomerID
SET c.LastPurchaseDate = s.Latest;

-- 48. Return customer as JSON (MySQL 5.7+)
SELECT JSON_OBJECT('Customer', CustomerName, 'Points', Points, 'Membership', Membership) AS CustomerJSON FROM Customers;

-- 49. eset points for customers who joined before 2020
UPDATE Customers SET Points = 0 WHERE JoinDate < '2022-04-17';

-- 50. Customers in cities where Platinum members exist
SELECT * FROM Customers
WHERE City IN (
  SELECT DISTINCT City FROM Customers WHERE Membership = 'Platinum'
);


-- 4. Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT,
    StoreID INT,
    IsAvailable BOOLEAN,
    ManufactureDate DATE,
    ExpiryDate DATE,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- Insert records into 'Products'
INSERT INTO Products (ProductID,ProductName,Category,Brand,Price,Quantity,StoreID,IsAvailable,ManufactureDate,ExpiryDate)VALUES
(1, 'Slim Fit Shirt', 'Clothing', 'Zara', 1499.00, 50, 1, TRUE, '2024-01-15', '2026-01-15'),
(2, 'Running Shoes', 'Footwear', 'Nike', 4999.00, 30, 2, TRUE, '2023-12-10', '2026-12-10'),
(3, 'Espresso Coffee', 'Beverages', 'Starbucks', 299.00, 100, 3, TRUE, '2024-05-01', '2024-11-01'),
(4, 'LED TV 42"', 'Electronics', 'Sony', 25000.00, 10, 4, TRUE, '2023-11-11', '2028-11-11'),
(5, 'Denim Jacket', 'Clothing', 'H&M', 1999.00, 40, 5, TRUE, '2024-02-20', '2026-02-20'),
(6, 'Veg Sandwich', 'Food', 'Subway', 150.00, 200, 6, TRUE, '2025-07-12', '2025-07-13'),
(7, 'Smartphone', 'Electronics', 'Samsung', 18000.00, 15, 7, TRUE, '2024-03-01', '2028-03-01'),
(8, 'Cheese Pizza', 'Food', 'Domino\'s', 350.00, 80, 8, TRUE, '2025-07-12', '2025-07-13'),
(9, 'Sports T-shirt', 'Clothing', 'Puma', 899.00, 60, 9, TRUE, '2024-01-10', '2026-01-10'),
(10, 'Gold Necklace', 'Jewelry', 'Tanishq', 45000.00, 5, 10, TRUE, '2023-09-01', '2030-09-01');

-- to display table data 
select * from Products;

-- to remove complete records from table
truncate table Products;

-- to complete records and attributes from table
drop table Products;

-- 1. Add a new column for product rating
ALTER TABLE Products ADD Rating DECIMAL(2,1) DEFAULT 4.0;

-- 2. Drop the Rating column
ALTER TABLE Products DROP COLUMN Rating;

-- 3. Modify Quantity datatype
ALTER TABLE Products MODIFY Quantity INT UNSIGNED;

-- 4. Rename column IsAvailable to InStock
ALTER TABLE Products RENAME COLUMN IsAvailable TO InStock;

-- 5. Create index on ProductName
CREATE INDEX idx_productname ON Products(ProductName);

-- 6. Insert a new product
INSERT INTO Products VALUES (11, 'Bluetooth Headphones', 'Electronics', 'Boat', 2499.00, 25, 7, TRUE, '2024-07-01', '2027-07-01');

-- 7. Update price of all H&M products by 10%
UPDATE Products SET Price = Price * 1.10 WHERE Brand = 'H&M';

-- 8. Reduce quantity of expired food products
UPDATE Products SET Quantity = 0 WHERE Category = 'Food' AND ExpiryDate < CURDATE();

-- 9. Delete discontinued products
DELETE FROM Products WHERE InStock = FALSE;

-- 10. Clone all electronics to a new table
CREATE TABLE Electronics AS SELECT * FROM Products WHERE Category = 'Electronics';

-- 11. Get all products with price above 5000
SELECT * FROM Products WHERE Price > 5000;

-- 12. Show top 3 expensive products
SELECT * FROM Products ORDER BY Price DESC LIMIT 3;

-- 13. Get total stock quantity by category
SELECT Category, SUM(Quantity) AS TotalQty FROM Products GROUP BY Category;

-- 14. Find average price of products per brand
SELECT Brand, AVG(Price) AS AvgPrice FROM Products GROUP BY Brand;

-- 15. Get products manufactured in 2024
SELECT * FROM Products WHERE YEAR(ManufactureDate) = 2024;

-- 16. Products priced between 500 and 3000
SELECT * FROM Products WHERE Price BETWEEN 500 AND 3000;

-- 17. Products with name starting with 'S'
SELECT * FROM Products WHERE ProductName LIKE 'S%';

-- 18. Use CASE for product categorization
SELECT ProductName, Price,
  CASE
    WHEN Price > 10000 THEN 'Premium'
    WHEN Price BETWEEN 5000 AND 10000 THEN 'Mid-range'
    ELSE 'Budget'
  END AS PriceCategory
FROM Products;

-- 19. Display products with price rounded to nearest hundred
SELECT ProductName, ROUND(Price, -2) AS RoundedPrice FROM Products;

-- 20. Products available and will expire within 7 days
SELECT * FROM Products WHERE InStock = TRUE AND DATEDIFF(ExpiryDate, CURDATE()) <= 7;

-- 21. Transaction with rollback
START TRANSACTION;
UPDATE Products SET Quantity = Quantity - 10 WHERE ProductID = 1;
ROLLBACK;

-- 22. Transaction with commit
START TRANSACTION;
UPDATE Products SET Quantity = Quantity + 5 WHERE ProductID = 2;
COMMIT;

-- 23.  Products priced between 300 and 3000
SELECT * FROM Products WHERE Price BETWEEN 300 AND 3000;

-- 24.  Products priced between 200 and 3000
SELECT * FROM Products WHERE Price BETWEEN 200 AND 3000;

-- 25. View of all in-stock products above 2000
CREATE VIEW PremiumStock AS
SELECT ProductName, Price, Quantity FROM Products WHERE Price > 2000 AND InStock = TRUE;

-- 26.  Products priced between 300 and 3000
SELECT * FROM Products WHERE Price BETWEEN 100 AND 3000;

-- 27.  Products priced between 200 and 3000
SELECT * FROM Products WHERE Price BETWEEN 600 AND 3000;

-- 28. Products with above-average price
SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- 29. Brands with more than 1 product
SELECT Brand FROM Products
GROUP BY Brand
HAVING COUNT(*) > 1;

-- 30. Top product by price per category
WITH RankedProducts AS (
  SELECT *, RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS rnk
  FROM Products
)
SELECT * FROM RankedProducts WHERE rnk = 1;

-- 31. Function to calculate GST on price
DELIMITER //
CREATE FUNCTION CalcGST(price DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN price * 0.18;
END;
//
DELIMITER ;

-- 32. Use function
SELECT ProductName, Price, CalcGST(Price) AS GST FROM Products;

-- 33. Procedure to update stock by ProductID
DELIMITER //
CREATE PROCEDURE UpdateStock(IN pid INT, IN qty INT)
BEGIN
  UPDATE Products SET Quantity = Quantity + qty WHERE ProductID = pid;
END;
//
DELIMITER ;

-- 34. Call procedure
CALL UpdateStock(3, 20);

-- 35. View for average product price per category
CREATE VIEW AvgPricePerCategory AS
SELECT Category, ROUND(AVG(Price),2) AS AvgPrice
FROM Products
GROUP BY Category;

-- 36. Brands with average price > 5000
SELECT Brand, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Brand
HAVING AvgPrice > 5000;

-- 37. Show month of manufacture
SELECT ProductName, MONTHNAME(ManufactureDate) AS ManufactureMonth FROM Products;

-- 38. Brand domain-style email
SELECT Brand, LOWER(CONCAT(Brand, '@vivianamall.com')) AS BrandEmail FROM Products;

-- 39. Label product freshness
SELECT ProductName, ExpiryDate,
  CASE
    WHEN ExpiryDate < CURDATE() THEN 'Expired'
    WHEN DATEDIFF(ExpiryDate, CURDATE()) <= 7 THEN 'Expiring Soon'
    ELSE 'Fresh'
  END AS Freshness
FROM Products;

-- 40. Show each product with average category price
SELECT ProductName, Price,
  (SELECT AVG(Price) FROM Products p2 WHERE p2.Category = p1.Category) AS AvgCategoryPrice
FROM Products p1;

-- 41. Delete expired products not in stock
DELETE FROM Products
WHERE InStock = FALSE AND ExpiryDate < CURDATE();

-- 42. Product value (stock × price)
SELECT ProductName, Quantity, Price, (Quantity * Price) AS InventoryValue FROM Products;

-- 43. Electronics or clothing with price < 2000
SELECT * FROM Products
WHERE (Category = 'Electronics' OR Category = 'Clothing') AND Price < 2000;

-- 44. Procedure to mark out-of-stock items
DELIMITER //
CREATE PROCEDURE MarkOutOfStock()
BEGIN
  UPDATE Products SET InStock = FALSE WHERE Quantity <= 0;
END;
//
DELIMITER ;

-- 45. Call it
CALL MarkOutOfStock();

-- 46.  Products priced between 200 and 3000
SELECT * FROM Products WHERE Price BETWEEN 800 AND 3000;

-- 47. Return product as JSON object
SELECT JSON_OBJECT('Product', ProductName, 'Price', Price, 'InStock', InStock) AS ProductJSON FROM Products;

-- 48. Products priced between 200 and 3000
SELECT * FROM Products WHERE Price BETWEEN 900 AND 3000;

-- 49. Products in categories that include 'Food'
SELECT * FROM Products WHERE Category IN (
  SELECT DISTINCT Category FROM Products WHERE Category = 'Food'
);

-- 50. Stock summary by brand and category
SELECT Brand, Category, SUM(Quantity) AS TotalStock
FROM Products
GROUP BY Brand, Category;


-- 5. Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    StoreID INT,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    SaleDate DATE,
    PaymentMethod VARCHAR(20),
    Discount DECIMAL(5,2),
    EmployeeID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmpID)
);

-- Insert records into 'Sales'
INSERT INTO Sales (SaleID,ProductID,CustomerID,StoreID,Quantity,TotalAmount,SaleDate,PaymentMethod,Discount,EmployeeID)VALUES
(1, 1, 1, 1, 2, 2998.00, '2025-07-01', 'Credit Card', 0.00, 1),
(2, 2, 2, 2, 1, 4999.00, '2025-07-02', 'UPI', 0.00, 2),
(3, 3, 3, 3, 3, 897.00, '2025-07-03', 'Cash', 0.00, 3),
(4, 4, 4, 4, 1, 25000.00, '2025-07-04', 'Credit Card', 500.00, 4),
(5, 5, 5, 5, 1, 1999.00, '2025-07-05', 'Debit Card', 0.00, 5),
(6, 6, 6, 6, 2, 300.00, '2025-07-06', 'UPI', 0.00, 6),
(7, 7, 7, 7, 1, 18000.00, '2025-07-07', 'Net Banking', 900.00, 7),
(8, 8, 8, 8, 2, 700.00, '2025-07-08', 'Cash', 0.00, 8),
(9, 9, 9, 9, 2, 1798.00, '2025-07-09', 'UPI', 0.00, 9),
(10, 10, 10, 10, 1, 45000.00, '2025-07-10', 'Credit Card', 999.00, 10);

-- to display table data
select * from Sales;

-- to remove complete records from table
truncate table Sales;

-- to remove complete records and attributes from table
drop table Sales;

-- 1. Add a new column for SaleStatus
ALTER TABLE Sales ADD SaleStatus VARCHAR(20) DEFAULT 'Completed';

-- 2. Rename column Discount to DiscountAmount
ALTER TABLE Sales RENAME COLUMN Discount TO DiscountAmount;

-- 3. Create index on SaleDate
CREATE INDEX idx_saledate ON Sales(SaleDate);

-- 4. Add constraint to ensure TotalAmount > 0
ALTER TABLE Sales ADD CONSTRAINT chk_amount CHECK (TotalAmount > 0);

-- 5. Drop column SaleStatus
ALTER TABLE Sales DROP COLUMN SaleStatus;

-- 6. Insert a new sale record
INSERT INTO Sales VALUES (11, 3, 2, 3, 1, 299.00, '2025-07-11', 'Cash', 0.00, 3);

-- 7. Update TotalAmount after applying 10% discount on a sale
UPDATE Sales SET TotalAmount = TotalAmount * 0.9 WHERE SaleID = 4;

-- 8. Delete sales with zero quantity (if any)
DELETE FROM Sales WHERE Quantity = 0;

-- 9. Update payment method from UPI to Net Banking for specific store
UPDATE Sales SET PaymentMethod = 'Net Banking' WHERE PaymentMethod = 'UPI' AND StoreID = 2;

-- 10. Duplicate a sale record for testing
INSERT INTO Sales
SELECT 12, ProductID, CustomerID, StoreID, Quantity, TotalAmount, SaleDate, PaymentMethod, DiscountAmount, EmployeeID
FROM Sales WHERE SaleID = 1;

-- 11. Select all credit card transactions
SELECT * FROM Sales WHERE PaymentMethod = 'Credit Card';

-- 12. Get top 3 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 3;

-- 13. Show sale amount with discount subtracted
SELECT SaleID, TotalAmount - DiscountAmount AS NetAmount FROM Sales;

-- 14. Group sales by PaymentMethod
SELECT PaymentMethod, COUNT(*) AS NoOfSales FROM Sales GROUP BY PaymentMethod;

-- 15. Filter sales in the first week of July
SELECT * FROM Sales WHERE SaleDate BETWEEN '2025-07-01' AND '2025-07-07';

-- 16. Calculate average sale amount per store
SELECT StoreID, ROUND(AVG(TotalAmount),2) AS AvgSale FROM Sales GROUP BY StoreID;

-- 17. Sales above average
SELECT * FROM Sales WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Sales);

-- 18. Sale categorization based on amount
SELECT SaleID, TotalAmount,
  CASE
    WHEN TotalAmount > 20000 THEN 'High'
    WHEN TotalAmount > 5000 THEN 'Medium'
    ELSE 'Low'
  END AS Category
FROM Sales;

-- 19. Get month name from SaleDate
SELECT SaleID, MONTHNAME(SaleDate) AS Month FROM Sales;

-- 20. Format total amount to include currency
SELECT CONCAT('₹', FORMAT(TotalAmount, 2)) AS Amount FROM Sales;

-- 21. Start transaction to correct Sale and rollback
START TRANSACTION;
UPDATE Sales SET TotalAmount = TotalAmount + 1000 WHERE SaleID = 2;
ROLLBACK;

-- 22. Commit sale update
START TRANSACTION;
UPDATE Sales SET DiscountAmount = 0 WHERE SaleID = 5;
COMMIT;

-- 23. Set savepoint and rollback to it
START TRANSACTION;
UPDATE Sales SET Quantity = 10 WHERE SaleID = 3;
SAVEPOINT sp1;
UPDATE Sales SET TotalAmount = 50000 WHERE SaleID = 3;
ROLLBACK TO sp1;
COMMIT;

-- 24. Select all UPI transactions
SELECT * FROM Sales WHERE PaymentMethod = 'UPI';


-- 25. Select all cash transactions
SELECT * FROM Sales WHERE PaymentMethod = 'cash';

-- 26. Get top 4 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 4;

-- 27. Get top 5 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 5;

-- 28. Get top 6 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 6;

-- 29.  Get top 7 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 7;

-- 30. Get top 8 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 8;

-- 31. Sales by customers with more than 1000 points
SELECT * FROM Sales WHERE CustomerID IN (
  SELECT CustomerID FROM Customers WHERE Points > 1000
);

-- 32. Product sold most expensive
SELECT * FROM Sales WHERE TotalAmount = (
  SELECT MAX(TotalAmount) FROM Sales
);

-- 33. Get top 9 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 9;

-- 34. Get top 1 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 1;

-- 35. Stores with more than 2 sales
SELECT StoreID FROM Sales GROUP BY StoreID HAVING COUNT(*) > 2;

-- 36. Create view for all credit card transactions
CREATE VIEW CreditSales AS
SELECT * FROM Sales WHERE PaymentMethod = 'Credit Card';

-- 37. View for total sales per employee
CREATE VIEW EmployeeSales AS
SELECT EmployeeID, COUNT(*) AS NumSales, SUM(TotalAmount) AS TotalSales
FROM Sales GROUP BY EmployeeID;

-- 38. View with net payable amount (after discount)
CREATE VIEW SaleNetAmount AS
SELECT SaleID, TotalAmount, DiscountAmount, (TotalAmount - DiscountAmount) AS NetPayable
FROM Sales;

-- 39. CTE to find top sale per payment method
WITH RankedSales AS (
  SELECT *, RANK() OVER (PARTITION BY PaymentMethod ORDER BY TotalAmount DESC) AS rnk
  FROM Sales
)
SELECT * FROM RankedSales WHERE rnk = 1;

-- 40. CTE for monthly sales
WITH MonthlySales AS (
  SELECT MONTH(SaleDate) AS Month, SUM(TotalAmount) AS Total
  FROM Sales GROUP BY MONTH(SaleDate)
)
SELECT * FROM MonthlySales;

-- 41. UDF to calculate tax (18%) on sale
DELIMITER //
CREATE FUNCTION CalcTax(amount DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN amount * 0.18;
END;
//
DELIMITER ;

-- 42. Using UDF in query
SELECT SaleID, TotalAmount, CalcTax(TotalAmount) AS Tax FROM Sales;

-- 43. Function to get discount percentage
DELIMITER //
CREATE FUNCTION DiscountPercent(amount DECIMAL(10,2), discount DECIMAL(10,2)) RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  RETURN (discount / amount) * 100;
END;
//
DELIMITER ;

-- 44. SP to update sale amount
DELIMITER //
CREATE PROCEDURE UpdateSaleAmount(IN sale_id INT, IN new_amt DECIMAL(10,2))
BEGIN
  UPDATE Sales SET TotalAmount = new_amt WHERE SaleID = sale_id;
END;
//
DELIMITER ;

-- 45. SP to get sales summary for customer
DELIMITER //
CREATE PROCEDURE CustomerSales(IN cust_id INT)
BEGIN
  SELECT COUNT(*) AS NumSales, SUM(TotalAmount) AS TotalSpent
  FROM Sales WHERE CustomerID = cust_id;
END;
//
DELIMITER ;

-- 46. Call procedure
CALL CustomerSales(1);

-- 47. Total sales made per product
SELECT p.ProductName, SUM(s.TotalAmount) AS TotalRevenue
FROM Sales s JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName;

-- 48. Get top 11 highest total sales
SELECT * FROM Sales ORDER BY TotalAmount DESC LIMIT 11;

-- 49. Net revenue per store (after discount)
SELECT st.StoreName, SUM(s.TotalAmount - s.DiscountAmount) AS NetRevenue
FROM Sales s JOIN Stores st ON s.StoreID = st.StoreID
GROUP BY st.StoreName;

-- 50. Product-category-wise sales summary
SELECT p.Category, COUNT(s.SaleID) AS NumSales, SUM(s.TotalAmount) AS Total
FROM Sales s JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;