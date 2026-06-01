------------------------ alter for add column ------------------------
Alter table student add demo int;
(TO ADD NEW COLOUM IN THE DATA BASE)


------------------------ Update of single and multiple values
Update Student set demo = 25

Update Student set demo = 100 where Division = 'A'
(IN WHICH THE NEW COLUMN IS ADDED , TO PUT THE VALUE)

----------------------- Alter for Remove column  ------------------------------
Alter table Student drop column demo;



----------------------- Delete for particular -------------------------------------
Delete from Student where ScienceMarks < 50;
(SHOW THE CONDITION WISE IF THE CONDITION IS MATCH OR NOT)


----------------------- Truncate for All data Delete -----------------------------
Truncate table student;
(ERASE THE ALL THE DATA OF ROW)


--------------------------- DROP for everything deleted with [data | Structure] ------------------------------
Drop table Student;
(ERASE ALL THE DATABASE)


----------------------------- AND | OR can use with anything like [update, select, delete]

-------- AND

Select * from student where std = 12 AND sciencemarks > 30;
(AND USE FOR THE SELECTIVE DATA ONLY , GIVES ONLY INPUT DATA ONLY )

-------- OR

Select * from student where std = 12 OR sciencemarks > 30;
(IF IN THE VLAUE HAS THE BOTH THE VALUE GIVE ALL DATA , IF ANY OF CONDITION WILL MATCH THEN GIVES THE OUTPUT)

-------- Between

Select * from student where mathsmarks between 50 and 100;
(GIVES FROM THE PARTICULAR COLUMN RANGE WISE MARKSOR ANYTHING)
---

------------------------- SEARCH ---------------------------

----- LIKE

SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'A%';
(FIND THE VALUE OF FIRST LETTER, IF WE WRITE THE ANY VALUE BEFORE THE [MOD] GIVES FIRST LETTER VALUE)


SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '%H';
(FIND THE VALUE OF LAST LETTER, IF WE WRITE THE ANY VALUE AFTER THE [MOD] GIVES LAST LETTER VALUE)


SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '%A%';
(FIND THE VALUE OF MIDDLE LETTER, IF WE WRITE THE ANY VALUE MIDDLE OF THE [MOD] GIVES MIDDLE VALUE)


SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '_K%';
(FIND THE VALUE OF SECOND LETTER, IF WE WRITE THE ANY VALUE BEFORE THE [UNDERSCORE (VALUE) MOD] GIVES SECOND LETTER VALUE)


SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '%S_';
(FIND THE VALUE OF SECOND LAST LETTER, IF WE WRITE THE ANY VALUE AFTER THE [MOD (VALUE) UNDERSCORE] GIVES SECOND LAST LETTER VALUE)


----- IN | NOT IN

SELECT * FROM STUDENT WHERE DIVISION IN ('A','B');
(GIVE ONLY THE VALUE WHICH YOU WANT SEE IN THE OUTPUT)

SELECT * FROM STUDENT WHERE DIVISION NOT IN ('A','B');
(REMOVE THE VALUE THAT YOU INPUT THE IN VALUE)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
----------------------- Aggreagte Functions -----------------------

1. Aggregate Functions (Basic)

These functions work on multiple rows and return one result.

✅ SUM(SALARY)
SELECT SUM(SALARY) AS TOTAL_SALARY FROM Employees;

👉 Adds all salary values together
💡 Example:
10000 + 20000 + 30000 = 60000
✔ Gives total salary of all employees
------------------------------------------------------------------------------
✅ COUNT(SALARY)
SELECT COUNT(SALARY) AS TOTAL_EMPLOYEES FROM Employees;

👉 Counts only non-null salary values
💡 If data:

10000
20000
NULL
30000

👉 Output = 3 (NULL is ignored)
------------------------------------------------------------------------------
✅ COUNT(*)
SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM Employees;

👉 Counts all rows, including NULL
💡 Same data:

10000
20000
NULL
30000

👉 Output = 4
✔ Best way to count total employees
----------------------------------------------------------------------------
✅ AVG(SALARY)
SELECT AVG(SALARY) AS AVG_SALARY FROM Employees;

👉 Finds average (mean)
💡 Formula:

SUM / COUNT (ignores NULL)

Example:

10000 + 20000 + 30000 = 60000
60000 / 3 = 20000
------------------------------------------------------------------------------
✅ MIN(SALARY)
SELECT MIN(SALARY) AS MINIMUM_SALARY FROM Employees;

👉 Finds smallest salary

✅ MAX(SALARY)
SELECT MAX(SALARY) AS MAXIMUM_SALARY FROM Employees;

👉 Finds highest salary
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
🔹 2. GROUP BY (Very Important)

👉 Used when you want results category-wise

Example:
SELECT DEPARTMENT, SUM(SALARY)
FROM Employees
GROUP BY DEPARTMENT;

👉 Meaning:

Divide employees by department

Then calculate total salary for each department

💡 Output:

HR        → 50000
IT        → 120000
Sales     → 80000
More examples:
🔸 Average salary per department SELECT DEPARTMENT, AVG(SALARY) FROM Employees GROUP BY DEPARTMENT;
🔸 Minimum salary per department SELECT DEPARTMENT, MIN(SALARY) FROM Employees GROUP BY DEPARTMENT;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

🔹 3. HAVING (Filter on Groups)

👉 HAVING is like WHERE but works after GROUP BY

Example:
SELECT DEPARTMENT, SUM(SALARY) FROM Employees GROUP BY DEPARTMENT HAVING SUM(SALARY) > 150000;

👉 Meaning:
First group by department
Then show only those departments where total salary > 150000

💡 Output:

IT → 200000 ✔
Sales → 120000 ❌ (removed)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
THIS IS MATH FUNCTION :-
  
SELECT 
    ABS(-25) AS ABS_Value,
    CEILING(4.2) AS Ceiling_Value,
    FLOOR(4.8) AS Floor_Value,
    ROUND(123.456, 2) AS Round_2_Decimals,
    ROUND(123.456, 0) AS Round_Whole,
	ROUND(123.456, 2, 1) AS Round_2_Truncates,
	ROUND(123.456, 2, 0) AS Round_2_Default_Round,
    POWER(2, 3) AS Power_Value,
    SQRT(16) AS Square_Root,
	SQUARE(5) AS Square_function,
    RAND() AS Random_Number,
    LOG(10) AS Log_Value,
    EXP(2) AS Exp_Value,
    PI() AS Pi_Value,
    SIGN(10) AS Sign_Positive,
	SIGN(-10) AS Sign_Negative,
	SIGN(0) AS Sign_Netural;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
THIS IS STRING FUNCTION :-   

SELECT 
    '   Hello World   ' AS Original_String,

    LEN('Hello') AS Length_Value,
    UPPER('hello') AS Uppercase_Value,
    LOWER('HELLO') AS Lowercase_Value,

    LTRIM('   Hello') AS Left_Trim,
    RTRIM('Hello   ') AS Right_Trim,
    TRIM('   Hello   ') AS Full_Trim,

    SUBSTRING('Hello World', 1, 5) AS Sub_String,
    CHARINDEX('World', 'Hello World') AS Char_Index,

    REPLACE('Hello World', 'World', 'SQL') AS Replace_Value,

    CONCAT('Hello', ' - ', ' &&&--','World') AS Concatenated_Value,
	'Hello' + ' ' + 'World' AS Manual_Concate,

    LEFT('Hello World', 5) AS Left_Value,
    RIGHT('Hello World', 5) AS Right_Value,

    REVERSE('Hello') AS Reverse_Value,

    FORMAT(GETDATE(), 'MM-dd-yyyy') AS Formatted_Date;


---------------------- JOIN--- a JOIN is used to combine rows from two or more tables based on a related column between them.
	What is a JOIN?

	A JOIN retrieves data from multiple tables by linking them using a common column (usually a key).

	👉 Example idea:
	You have:

	Employees table (Employee details)
	Departments table (Department info)

	JOIN helps you see which employee belongs to which department.

========================================================================================================================================================================================		

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Admin'),
(7, 'Legal'),
(8, 'R&D'),
(9, 'Support'),
(10, 'Logistics');

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT
);

INSERT INTO Employees VALUES
(101, 'Amit', 1),
(102, 'Neha', 2),
(103, 'Raj', 3),
(104, 'Priya', 4),
(105, 'Karan', 5),
(106, 'Sneha', 2),
(107, 'Vikas', 8),
(108, 'Anjali', NULL),
(109, 'Rohit', 15),  -- No matching dept
(110, 'Meena', 3);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------- INNER JOIN --- Returns only matching records
SELECT E.EmpName, D.DeptName
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.DeptID;


----------------- LEFT JOIN --- All employees + matching departments
SELECT E.EmpName, D.DeptName
FROM Employees E
LEFT JOIN Departments D
ON E.DeptID = D.DeptID;


---------- LEFT JOINS AS RIGHT JOIN
SELECT E.EmpName, D.DeptName
FROM Departments D
LEFT JOIN Employees E
ON E.DeptID = D.DeptID;


---------------- RIGHT JOIN --- All departments + matching employees
SELECT E.EmpName, D.DeptName
FROM Employees E
RIGHT JOIN Departments D
ON E.DeptID = D.DeptID;


----------- RIGHT JOIN AS LEFT JOIN
SELECT E.EmpName, D.DeptName
FROM Departments D
RIGHT JOIN Employees E
ON E.DeptID = D.DeptID;


---------------- FULL OUTER JOIN  --- All records from both tables
SELECT E.EmpName, D.DeptName
FROM Employees E
FULL OUTER JOIN Departments D
ON E.DeptID = D.DeptID;


--------------- CROSS JOIN  --- Every employee with every department
SELECT E.EmpName, D.DeptName
FROM Employees E
CROSS JOIN Departments D;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------ SUBQUERIES ----------------------------------------------------------

-- Subquery in WHERE (Single Value) -- Find students who paid more than the average payment

SELECT FullName, StudentID
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Payments
    WHERE AmountPaid > (
        SELECT AVG(AmountPaid) FROM Payments
    )
);


-- Subquery with IN --- Find students enrolled in Data Science or Python Programming

SELECT FullName
FROM Students
WHERE CourseID IN (
    SELECT CourseID
    FROM Courses
    WHERE CourseName IN ('Data Science', 'Python Programming')
);


-- Subquery with EXISTS --- Find students who have made at least one payment 


SELECT FullName
FROM Students S
WHERE EXISTS (
    SELECT 1
    FROM Payments P
    WHERE P.StudentID = S.StudentID
);

-- Subquery in FROM (Derived Table)  --- Find average payment per student

SELECT StudentID, AVG(AmountPaid) AS AvgPayment
FROM (
    SELECT StudentID, AmountPaid
    FROM Payments
) AS Temp
GROUP BY StudentID;


-- Subquery with = (Single Row Subquery) --- Find student who paid the highest amount

SELECT FullName
FROM Students
WHERE StudentID = (
    SELECT StudentID
    FROM Payments
    WHERE AmountPaid = (
        SELECT MAX(AmountPaid) FROM Payments
    )
);


--  Correlated Subquery --- Find students who paid full course fees

SELECT FullName
FROM Students S
WHERE (
    SELECT AmountPaid
    FROM Payments P
    WHERE P.StudentID = S.StudentID
) = (
    SELECT Fees
    FROM Courses C
    WHERE C.CourseID = S.CourseID
);

--------------- SELF JOIN  --- Table joined with itself

SELECT A.EmpName AS Employee1, B.EmpName AS Employee2, A.DeptID
FROM Employees A
JOIN Employees B
ON A.DeptID = B.DeptID
AND A.EmpID <> B.EmpID;	



------------------------------------------------ window functions ---------------------------------------------

-- Create Employees Table
CREATE TABLE Employees (
    EmpID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

-- Insert Sample Data
INSERT INTO Employees VALUES
(1, 'John', 'IT', 90000),
(2, 'Mike', 'IT', 85000),
(3, 'Sara', 'HR', 85000),
(4, 'Tom', 'HR', 80000),
(5, 'Emma', 'Finance', 75000),
(6, 'David', 'Finance', 70000),
(7, 'Alex', 'IT', 90000),       -- same salary as John
(8, 'Sophia', 'IT', 85000),     -- same salary as Mike
(9, 'Liam', 'HR', 80000),       -- same salary as Tom
(10, 'Noah', 'HR', 80000),      -- duplicate salary again
(11, 'Olivia', 'Finance', 75000), -- same salary as Emma
(12, 'Ava', 'Finance', 70000),   -- same salary as David
(13, 'Ethan', 'IT', 95000),     -- highest salary
(14, 'Mia', 'IT', 60000),       -- lowest salary
(15, 'Lucas', 'HR', 85000);     -- duplicate HR salary

--------------------------------- window functions -------------------------------------------------

CREATE TABLE daily_sales (
    sale_date DATE,
    product_name VARCHAR(50),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(10,2)
);

INSERT INTO daily_sales (sale_date, product_name, units_sold, unit_price, total_sales)
VALUES
('2026-05-20', 'T-Shirt', 15, 499.00, 7485.00),
('2026-05-21', 'Jeans', 8, 1299.00, 10392.00),
('2026-05-22', 'Sneakers', 5, 2499.00, 12495.00),

('2026-05-23', 'Hoodie', 10, 899.00, 8990.00),
('2026-05-24', 'Cap', 20, 199.00, 3980.00),
('2026-05-25', 'Jacket', 6, 1999.00, 11994.00),

('2026-05-26', 'T-Shirt', 12, 499.00, 5988.00),
('2026-05-27', 'Sneakers', 7, 2499.00, 17493.00);


INSERT INTO daily_sales (sale_date, product_name, units_sold, unit_price, total_sales)
VALUES
('2026-05-20', 'T-Shirt', 10, 500.00, 5000.00),
('2026-05-21', 'T-Shirt', 12, 500.00, 6000.00),
('2026-05-22', 'T-Shirt', 15, 500.00, 7500.00),
('2026-05-23', 'T-Shirt', 20, 500.00, 10000.00),
('2026-05-24', 'T-Shirt', 18, 500.00, 9000.00),

('2026-05-20', 'Jeans', 5, 1200.00, 6000.00),
('2026-05-21', 'Jeans', 6, 1200.00, 7200.00),
('2026-05-22', 'Jeans', 7, 1200.00, 8400.00),
('2026-05-23', 'Jeans', 8, 1200.00, 9600.00),
('2026-05-24', 'Jeans', 10, 1200.00, 12000.00);


--------------- ROW_NUMBER() - Assigns a unique sequential number to each row.

SELECT 
    EmployeeName,
    Salary,
    ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Employees;

--------------- RANK() -- Assigns rank with gaps when ties occur.

SELECT 
    EmployeeName,
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS RankNum
FROM Employees;


--------------- DENSE_RANK()  --- Assigns rank without gaps.

SELECT 
    EmployeeName,
    Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRankNum
FROM Employees;


--------------- NTILE()  --- Divides rows into groups.

SELECT 
    EmployeeName,
    Salary,
    NTILE(5) OVER (ORDER BY Salary DESC) AS GroupNo
FROM Employees;


-------------- SUM() OVER()  --- Running total or grouped total.

SELECT
    EmployeeName,
    Salary,
    SUM(Salary) OVER() AS TotalSalary
FROM Employees;


SELECT
    EmployeeName,
    Salary,
    SUM(Salary) OVER(ORDER BY Salary) AS RunningTotal
FROM Employees;


SELECT
    sale_date,
    product_name,
    units_sold,
    unit_price,
    total_sales,
    SUM(total_sales) OVER() AS TotalSalesAllDays
FROM daily_sales;


SELECT
    sale_date,
    product_name,
	total_sales,
    SUM(total_sales) OVER(ORDER BY sale_date) AS RunningTotalSales
FROM daily_sales;


--------------- MAX() OVER()  --  Finds maximum value.

SELECT
    EmployeeName,
    Salary,
    MAX(Salary) OVER() AS MaxSalary
FROM Employees;


--------------- LAG() --- Gets previous row value.

SELECT
    sale_date,
    total_sales,
    LAG(total_sales) OVER(
       ORDER BY sale_date
    ) AS prev_sales_same_product
FROM daily_sales;


SELECT
    sale_date,
    product_name,
    total_sales,
    LAG(total_sales) OVER(
        PARTITION BY product_name
        ORDER BY sale_date
    ) AS prev_sales_same_product
FROM daily_sales;


----------------------- LEAD()  --- Gets next row value.

-- LEAD() on daily_sales (Next Sales Value)

SELECT
    sale_date,
    product_name,
    total_sales,
    LEAD(total_sales) OVER(ORDER BY sale_date) AS next_day_sales
FROM daily_sales;


-- next_sales_same_product

SELECT
    sale_date,
    product_name,
    total_sales,
    LEAD(total_sales) OVER(
        PARTITION BY product_name
        ORDER BY sale_date
    ) AS next_sales_same_product
FROM daily_sales;


-- Difference with next day:

SELECT
    sale_date,
    product_name,
    total_sales,
    LEAD(total_sales) OVER(ORDER BY sale_date) AS next_day_sales,
    LEAD(total_sales) OVER(ORDER BY sale_date) - total_sales AS sales_gap
FROM daily_sales;


-------------- FIRST_VALUE() --- Returns first value in window.

SELECT
    EmployeeName,
    Salary,
    FIRST_VALUE(Salary) OVER(ORDER BY Salary DESC) AS HighestSalary
FROM Employees;

/*
--- LAST_VALUE()  --- Returns last value in window.

SELECT
    EmployeeName,
    Salary,
    LAST_VALUE(Salary) OVER(
        ORDER BY Salary
        ROWS BETWEEN UNBOUNDED PRECEDING 
        AND UNBOUNDED FOLLOWING
    ) AS LastSalary
FROM Employees;
*/

-------------------		PERCENT_RANK()  --- Returns percentage rank.


-- PERCENT_RANK() on daily_sales

SELECT
    sale_date,
    product_name,
    total_sales,
    PERCENT_RANK() OVER(ORDER BY total_sales) AS percent_rank
FROM daily_sales;

---- percent_rank_per_product

SELECT
    sale_date,
    product_name,
    total_sales,
    PERCENT_RANK() OVER(
        PARTITION BY product_name
        ORDER BY total_sales
    ) AS percent_rank_per_product
FROM daily_sales;

/*
 PERCENTILE_CONT()  --  Continuous percentile. | PERCENTILE_DISC()
 ????????????
 */



 ------------ PARTITION BY

 SELECT
    Department,
    EmployeeName,
    Salary,
    SUM(Salary) OVER(PARTITION BY Department) AS DeptTotal
FROM Employees;



--------------- ROWS BETWEEN Example  --- Moving average of 3 rows

SELECT
    sale_date,
    product_name,
    total_sales,
    AVG(total_sales) OVER(
        ORDER BY sale_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM daily_sales;


select * from Employees;
