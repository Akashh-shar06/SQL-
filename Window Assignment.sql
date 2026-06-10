
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


SELECT * FROM Employe;
SELECT * FROM daily_sales;
SELECT * FROM Customer;
SELECT * FROM Orderrs;
SELECT * FROM EmployeesAttendance;

--1. Assign a row number to all employees based on salary in descending order.  
select 
	EmployeeName,
	salary,
	ROW_NUMBER () OVER (ORDER BY salary DESC) AS RowNum
	FROM Employe;

--2. Rank employees according to salary using RANK().  
SELECT 
	EmployeeName,
	Salary,
	RANK () OVER (ORDER BY Salary DESC) AS RankNum
	FROM Employe;

--3. Rank employees using DENSE_RANK() without gaps in ranking.  
Select 
	EmployeeName,
	DENSE_RANK () OVER (ORDER BY Salary DESC) AS DenseRank
	FROM Employe;

--4. Assign row numbers separately for each department.  
Select 
	department,
	EmployeeName,
	Salary,
	ROW_NUMBER () OVER (PARTITION BY Department ORDER BY Salary DESC)
	FrOM Employe;

--5. Find the top 3 highest-paid employees using ROW_NUMBER(). ---------------------  
WITH RankedEmployees AS 
( 
    SELECT *, 
           ROW_NUMBER() OVER(ORDER BY Salary DESC) AS rn 
    FROM Employees 
) 
SELECT * 
FROM RankedEmployees 
WHERE rn <= 3; 

--6. Divide employees into 4 equal salary groups using NTILE(4).  
Select 
	EmployeeName,
	Salary,
	NTILE(4) OVER (ORDER BY Salary DESC) AS NGroup
	FROM Employe;

--7. Divide products into 3 groups based on total sales.  
Select 
	product_name,
	total_sales,
	NTILE(3) OVER (ORDER BY Total_sales DESC) AS TotalSales 
	FROM daily_sales;

--8. Display each employee’s salary along with total company salary.  
Select 
	EmployeeName,
	Salary,	
	SUM(Salary) OVER() AS TotalCompanySalary 
	FROM Employe;

--9. Calculate running total of sales ordered by sale date.  
Select 
	Sale_date,
	Total_sales,
	SUM(Total_sales) OVER (ORDER BY Sale_date) as RunningTotal 
	FROM daily_sales;

--10. Show department-wise total salary using PARTITION BY. 
Select 
	department,
	EmployeeName,
	Salary,
	SUM(Salary) OVER (PARTITION BY Department) AS DeptTotalSalary
	FROM Employe;

--11. Show the maximum salary along with every employee record.  
Select 
	EmployeeName,
	Salary,
	MAX(Salary) OVER () AS MaxSalary
	From employe;

--12. Find highest sales value for each product category.  
Select 
	category,
	product_name,
	Total_sales,
	MAX(Total_sales) OVER (PARTITION BY Category ) AS HigestSales
	FROM daily_sales;

--13. Display previous day sales using LAG().
SELECT
    sale_date,
    total_sales,
    LAG(total_sales) OVER (ORDER BY sale_date) AS PreviousDaySales
FROM daily_sales;


--14. Show previous salary within each department.
SELECT
    Department,
    EmployeeName,
    Salary,
    LAG(Salary) OVER (
        PARTITION BY Department
        ORDER BY Salary
    ) AS PreviousSalary
FROM Employe;


--15. Find difference between current sales and previous sales.
SELECT
    sale_date,
    total_sales,
    total_sales -
    LAG(total_sales) OVER (ORDER BY sale_date) AS SalesDifference
FROM daily_sales;


--16. Display next day sales using LEAD().
SELECT
    sale_date,
    total_sales,
    LEAD(total_sales) OVER (ORDER BY sale_date) AS NextDaySales
FROM daily_sales;


--17. Show next employee salary ordered by salary.
SELECT
    EmployeeName,
    Salary,
    LEAD(Salary) OVER (ORDER BY Salary) AS NextSalary
FROM Employe;


--18. Show the highest salary using FIRST_VALUE().
SELECT
    EmployeeName,
    Salary,
    FIRST_VALUE(Salary) OVER (
        ORDER BY Salary DESC
    ) AS HighestSalary
FROM Employe;


--19. Display the last sales amount using LAST_VALUE().
SELECT
    sale_date,
    total_sales,
    LAST_VALUE(total_sales) OVER (
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS LastSalesAmount
FROM daily_sales;


--20. Calculate percentage rank of employees based on salary.
SELECT
    EmployeeName,
    Salary,
    PERCENT_RANK() OVER (ORDER BY Salary) AS PercentRank
FROM Employe;


--21. Find the first order placed by every customer.
WITH FirstOrders AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY CustomerID
               ORDER BY OrderDate
           ) AS rn
    FROM Orderrs
)
SELECT *
FROM FirstOrders
WHERE rn = 1;


--22. Determine the difference between current order amount and next order amount for each customer.
SELECT
    CustomerID,
    OrderDate,
    OrderAmount,
    LEAD(OrderAmount) OVER (
        PARTITION BY CustomerID
        ORDER BY OrderDate
    ) AS NextOrderAmount,
    OrderAmount -
    LEAD(OrderAmount) OVER (
        PARTITION BY CustomerID
        ORDER BY OrderDate
    ) AS Difference
FROM Orderrs;


--23. Calculate running total of customer purchases ordered by order date.
SELECT
    CustomerID,
    OrderDate,
    OrderAmount,
    SUM(OrderAmount) OVER (
        PARTITION BY CustomerID
        ORDER BY OrderDate
    ) AS RunningTotal
FROM Orderrs;


--24. Find customers whose current purchase amount is lower than their previous purchase.
WITH PurchaseData AS
(
    SELECT
        CustomerID,
        OrderDate,
        OrderAmount,
        LAG(OrderAmount) OVER (
            PARTITION BY CustomerID
            ORDER BY OrderDate
        ) AS PreviousPurchase
    FROM Orderrs
)
SELECT *
FROM PurchaseData
WHERE OrderAmount < PreviousPurchase;


--25. Identify top 3 highest spending customers in each city.
WITH CustomerSpending AS
(
    SELECT
        c.City,
        c.CustomerID,
        c.CustomerName,
        SUM(o.OrderAmount) AS TotalSpent
    FROM Customer c
    JOIN Orderrs o
        ON c.CustomerID = o.CustomerID
    GROUP BY
        c.City,
        c.CustomerID,
        c.CustomerName
),
RankedCustomers AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY City
               ORDER BY TotalSpent DESC
           ) AS rn
    FROM CustomerSpending
)
SELECT *
FROM RankedCustomers
WHERE rn <= 3;


--26. Calculate average employee salary within each department and compare individual salary against it.
SELECT
    Department,
    EmployeeName,
    Salary,
    AVG(Salary) OVER (
        PARTITION BY Department
    ) AS AvgDeptSalary,
    Salary -
    AVG(Salary) OVER (
        PARTITION BY Department
    ) AS DifferenceFromAvg
FROM Employe;


--27. Find employees whose salary falls in the top 10% using PERCENT_RANK().
WITH SalaryRank AS
(
    SELECT
        EmployeeName,
        Salary,
        PERCENT_RANK() OVER (
            ORDER BY Salary
        ) AS PRank
    FROM Employe
)
SELECT *
FROM SalaryRank
WHERE PRank >= 0.90;


--28. Generate department-wise salary rankings and display only the top 2 employees.
WITH DeptRank AS
(
    SELECT
        Department,
        EmployeeName,
        Salary,
        DENSE_RANK() OVER (
            PARTITION BY Department
            ORDER BY Salary DESC
        ) AS RankNo
    FROM Employe
)
SELECT *
FROM DeptRank
WHERE RankNo <= 2;


--29. Calculate a 3-month moving average of employee attendance percentage.
SELECT
    EmployeeID,
    MonthName,
    AttendancePercent,
    AVG(AttendancePercent) OVER (
        PARTITION BY EmployeeID
        ORDER BY
            CASE MonthName
                WHEN 'Jan' THEN 1
                WHEN 'Feb' THEN 2
                WHEN 'Mar' THEN 3
            END
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAverage
FROM EmployeesAttendance;

--30. Find the difference between an employee’s salary and the department’s highest salary.
SELECT
    Department,
    EmployeeName,
    Salary,
    MAX(Salary) OVER (
        PARTITION BY Department
    ) AS HighestDeptSalary,
    MAX(Salary) OVER (
        PARTITION BY Department
    ) - Salary AS Difference
FROM Employe;
