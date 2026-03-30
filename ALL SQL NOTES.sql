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


-- 



--------------- SELF JOIN  --- Table joined with itself
SELECT A.EmpName AS Employee1, B.EmpName AS Employee2, A.DeptID
FROM Employees A
JOIN Employees B
ON A.DeptID = B.DeptID
AND A.EmpID <> B.EmpID;	
