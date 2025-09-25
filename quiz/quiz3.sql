-- Step 1: Create or use an existing database
CREATE DATABASE CompanyDB;
USE CompanyDB;
Drop database CompanyDB;

-- Part A : Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10 , 2 )
);

INSERT INTO Employees (EmpID, Name, Department, Salary)
VALUES
(101, 'Yash Sharma', 'HR', 45000.00),
(102, 'Sahil Mehta', 'IT', 60000.00),
(103, 'Viraj Verma', 'Finance', 52000.00),
(104, 'Prathmesh Gupta', 'Marketing', 48000.00),
(105, 'Harshal Singh', 'Sales', 55000.00);

  -- Select all records from Flights table
select * FROM Employees;

update Employees
SET Salary = 60000.00
where EmpID = 105;

SET SQL_SAFE_UPDATES = 0;

DELETE From Employees
WHERE Department = 'HR';

SELECT *
From Employees
whERE Department = 'Finance';

-- Part B
SELECT *
FROM Employees
ORDER BY Salary DESC
LIMIT 3;

SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

SELECT *
from Employees
WHERE Salary > 50000 AND Salary < 80000;

SELECT *
FROM Employees
where Name LIKE 'A%';

-- Part-c
CREATE TABLE Students (
    RollNo INT unique,
    Name varchar(100),
    Marks INT CHECK (Marks >= 0)
);

ALTER TABLE Employees
add Email VARCHAR(100) NOT NULL;

alter table Employees
MODIFY Email varchar(100) NOT NULL;

-- Step 1: Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Step 2: Create Orders table refere to  Customers
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Part D
-- Fetch all customer names along with their order details (INNER JOIN)
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Display all employees and their assigned projects (LEFT JOIN)
SELECT Employees.Name, Projects.ProjectName
FROM Employees
LEFT JOIN Projects ON Employees.EmpID = Projects.EmpID;

-- List all departments and employees (RIGHT JOIN)
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.Department = Departments.DepartmentName;

--  Retrieve employees who have not been assigned to any project
SELECT Employees.Name
FROM Employees
LEFT JOIN Projects ON Employees.EmpID = Projects.EmpID
WHERE Projects.ProjectID IS NULL;

-- Combine two tables Branch_A_Employees and Branch_B_Employees using UNION
SELECT EmpID, Name, Department, Salary
FROM Branch_A_Employees
UNION
SELECT EmpID, Name, Department, Salary
FROM Branch_B_Employees;


-- Part E 
select MAX(Salary) AS SecondHighestSalary
FROM Employees
where Salary < (SELECT MAX(Salary) FROM Employees);

select Name, Salary
FROM Employees
where Salary > (SELECT AVG(Salary) FROM Employees);

SELECT Name, Department
FROM Employees
WHERE Department = (SELECT Department FROM Employees WHERE Name = 'Rohit');

SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where Orders.Amount > (SELECT AVG(Amount) FROM Orders);

-- part F
-- In MySQL
SELECT NOW() AS CurrentDateTime;

-- In SQL Server
SELECT GETDATE() AS CurrentDateTime;

-- In Oracal
SELECT SYSDATE AS CurrentDateTime FROM dual;


SELECT EmpID, Name, LENGTH(Name) AS NameLength
FROM Employees;


SELECT COUNT(*) AS TotalEmployees
FROM Employees;


SELECT EmpID, Name, GetBonus(Salary) AS Bonus
FROM Employees;

