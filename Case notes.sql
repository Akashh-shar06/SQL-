CREATE TABLE Employe (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary DECIMAL(10,2),
    PerformanceScore INT,
    JoiningDate DATE,
    AttendancePercent DECIMAL(5,2)
);

INSERT INTO Employe VALUES
(1, 'Amit', 'IT', 'Mumbai', 75000, 88, '2021-01-15', 95.5),
(2, 'Neha', 'HR', 'Delhi', 62000, 91, '2020-03-10', 97.0),
(3, 'Raj', 'Finance', 'Mumbi', 80000, 85, '2019-07-20', 92.5),
(4, 'Priya', 'IT', 'Pune', 90000, 94, '2022-02-11', 98.0),
(5, 'Karan', 'HR', 'Delhi', 58000, 79, '2021-08-01', 90.0),
(6, 'Sneha', 'Finance', 'Bangalore', 85000, 89, '2020-12-05', 96.2),
(7, 'Vikas', 'IT', 'Mumbai', 67000, 82, '2018-11-18', 88.5),
(8, 'Pooja', 'Sales', 'Chennai', 72000, 90, '2021-09-25', 93.5),
(9, 'Rohit', 'Sales', 'Mumbai', 69000, 76, '2019-06-15', 91.0),
(10, 'Anjali', 'Finance', 'Delhi', 95000, 97, '2017-04-30', 99.0);


CREATE TABLE daily_sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(10,2)
);

INSERT INTO daily_sales VALUES
(1, '2025-01-01', 'Laptop', 'Electronics', 2, 50000, 100000),
(2, '2025-01-02', 'Laptop', 'Electronics', 1, 50000, 50000),
(3, '2025-01-03', 'Mobile', 'Electronics', 5, 20000, 100000),
(4, '2025-01-04', 'Tablet', 'Electronics', 3, 15000, 45000),
(5, '2025-01-05', 'Laptop', 'Electronics', 2, 50000, 100000),
(6, '2025-01-06', 'Mobile', 'Electronics', 6, 20000, 120000),
(7, '2025-01-07', 'Tablet', 'Electronics', 4, 15000, 60000),
(8, '2025-01-08', 'Laptop', 'Electronics', 1, 50000, 50000),
(9, '2025-01-09', 'Mobile', 'Electronics', 7, 20000, 140000),
(10, '2025-01-10', 'Tablet', 'Electronics', 2, 15000, 30000);


CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Customer VALUES
(1, 'Arjun', 'Mumbai'),
(2, 'Meera', 'Delhi'),
(3, 'Kabir', 'Pune'),
(4, 'Simran', 'Mumbai'),
(5, 'Rahul', 'Chennai');


CREATE TABLE Orderrs (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Orderrs VALUES
(101, 1, '2025-01-01', 5000),
(102, 2, '2025-01-02', 7000),
(103, 1, '2025-01-05', 3000),
(104, 3, '2025-01-06', 9000),
(105, 4, '2025-01-07', 4000),
(106, 2, '2025-01-08', 6500),
(107, 5, '2025-01-09', 10000),
(108, 1, '2025-01-10', 2000),
(109, 3, '2025-01-11', 12000),
(110, 4, '2025-01-12', 8000);


CREATE TABLE EmployeesAttendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    MonthName VARCHAR(20),
    AttendancePercent DECIMAL(5,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employe(EmployeeID)
);

INSERT INTO EmployeesAttendance VALUES
(1, 1, 'Jan', 95.0),
(2, 1, 'Feb', 96.5),
(3, 1, 'Mar', 94.0),
(4, 2, 'Jan', 97.0),
(5, 2, 'Feb', 98.0),
(6, 2, 'Mar', 96.5),
(7, 3, 'Jan', 92.0),
(8, 3, 'Feb', 91.5),
(9, 3, 'Mar', 93.0),
(10, 4, 'Jan', 99.0),
(11, 4, 'Feb', 98.5),
(12, 4, 'Mar', 97.5);





----------------------------------CASE Statement
--- CASE is used to implement conditional logic (similar to IF-ELSE in programming languages) inside SELECT, UPDATE, ORDER BY, GROUP BY, and aggregate functions.


-- 1. . Simple CASE Statement -- Checks a single expression against multiple values.


SELECT EmployeeName,
       Department,
       CASE Department
            WHEN 'IT' THEN 'Technical'
            WHEN 'HR' THEN 'Management'
            WHEN 'Finance' THEN 'Accounts'
            ELSE 'Other'
       END AS DeptCategory
FROM Employe;

--- 2. Searched CASE Statement --- Uses conditions instead of exact matching.

SELECT EmployeeName,
       Salary,
       CASE
           WHEN Salary >= 90000 THEN 'A Class'
           WHEN Salary >= 75000 THEN 'B Class'
           WHEN Salary >= 60000 THEN 'C Class'
           ELSE 'D Class'
       END AS SalaryGrade
FROM Employe;


--- 3. CASE with Performance Score --- Employee Performance Rating

SELECT EmployeeName,
       PerformanceScore,
       CASE
           WHEN PerformanceScore >= 95 THEN 'Excellent'
           WHEN PerformanceScore >= 90 THEN 'Very Good'
           WHEN PerformanceScore >= 80 THEN 'Good'
           ELSE 'Needs Improvement'
       END AS Rating
FROM Employe;



--- CASE in ORDER BY --- Sort IT employees first.

SELECT *
FROM Employe
ORDER BY
CASE
    WHEN Department='IT' THEN 1
    WHEN Department='Finance' THEN 2
    WHEN Department='HR' THEN 3
    ELSE 4
END; 


--- CASE with Aggregate Function  --- Count employees by performance category.

SELECT
    SUM(CASE WHEN PerformanceScore >= 90 THEN 1 ELSE 0 END) AS HighPerformers,
    SUM(CASE WHEN PerformanceScore < 90 THEN 1 ELSE 0 END) AS Others
FROM Employe;


--- CASE for Bonus Calculation
 SELECT EmployeeName,
       Salary,
       CASE
           WHEN PerformanceScore >= 95 THEN Salary * 0.20
           WHEN PerformanceScore >= 90 THEN Salary * 0.15
           WHEN PerformanceScore >= 80 THEN Salary * 0.10
           ELSE Salary * 0.05
       END AS Bonus
FROM Employe;

--- CASE with Customer Orders  --- Customer Spending Level

SELECT c.CustomerName,
       o.OrderAmount,
       CASE
           WHEN o.OrderAmount >= 10000 THEN 'Premium'
           WHEN o.OrderAmount >= 5000 THEN 'Regular'
           ELSE 'Basic'
       END AS CustomerType
FROM Customer c
JOIN Orderrs o
ON c.CustomerID = o.CustomerID;


--- CASE with NULL Handling

SELECT EmployeeName,
       CASE
           WHEN City IS NULL THEN 'City Not Available'
           ELSE City
       END AS CityStatus
FROM Employe;


--- CASE inside UPDATE  --- Increase salary based on performance.

UPDATE Employe
SET Salary =
CASE
    WHEN PerformanceScore >= 95 THEN Salary * 1.20
    WHEN PerformanceScore >= 90 THEN Salary * 1.15
    ELSE Salary * 1.05
END;


--- CASE with GROUP BY  --- Department-wise Performance Group.

SELECT
    CASE
        WHEN PerformanceScore >= 90 THEN 'High'
        ELSE 'Low'
    END AS PerformanceGroup,
    COUNT(*) AS EmployeeCount
FROM Employe
GROUP BY
CASE
    WHEN PerformanceScore >= 90 THEN 'High'
    ELSE 'Low'
END;



--- Nested CASE

SELECT EmployeeName,
       Salary,
       PerformanceScore,
       CASE
           WHEN Salary > 80000 THEN
                CASE
                    WHEN PerformanceScore > 90
                    THEN 'Star Employee'
                    ELSE 'High Salary Employee'
                END
           ELSE 'Regular Employee'
       END AS EmployeeCategory
FROM Employe;


--- CASE with Date Conditions  --- Experience Level based on Joining Date.

SELECT EmployeeName,
       JoiningDate,
       CASE
           WHEN JoiningDate < '2020-01-01'
                THEN 'Senior Employee'
           WHEN JoiningDate < '2022-01-01'
                THEN 'Mid-Level Employee'
           ELSE 'New Employee'
       END AS ExperienceLevel
FROM Employe;




---------------------------------------------------------------------------------------
--- IF Statement in SQL Server  --- IF...ELSE is used in procedural code blocks, unlike CASE which is used inside queries.


--- Basic IF ELSE

DECLARE @Salary DECIMAL(10,2);

SET @Salary = 85000;

IF @Salary > 80000
    PRINT 'High Salary';
ELSE
    PRINT 'Normal Salary';


--- IF with Employee Count

DECLARE @EmpCount INT;

SELECT @EmpCount = COUNT(*)
FROM Employe;

IF @EmpCount > 5
    PRINT 'More than 5 Employees';
ELSE
    PRINT '5 or Less Employees';


---- IF EXISTS  ---- Check whether Mumbai employees exist.

IF EXISTS
(
    SELECT *
    FROM Employe
    WHERE City='Mumbai'
)
    PRINT 'Mumbai Employees Found';
ELSE
    PRINT 'No Mumbai Employees';


--- IF NOT EXISTS

IF NOT EXISTS
(
    SELECT *
    FROM Employe
    WHERE Department='Marketing'
)
    PRINT 'Marketing Department Not Found';


--- IF with Aggregate Values

DECLARE @AvgSalary DECIMAL(10,2);

SELECT @AvgSalary = AVG(Salary)
FROM Employe;

IF @AvgSalary > 75000
    PRINT 'Average Salary is High';
ELSE
    PRINT 'Average Salary is Low';


--- IF ELSE IF Example

DECLARE @Score INT = 92;

IF @Score >= 95
    PRINT 'Excellent';
ELSE IF @Score >= 90
    PRINT 'Very Good';
ELSE IF @Score >= 80
    PRINT 'Good';
ELSE
    PRINT 'Needs Improvement';


--- 










SELECT * FROM Employe;
SELECT * FROM daily_sales;
SELECT * FROM Customer;
SELECT * FROM Orderrs;
SELECT * FROM EmployeesAttendance;




