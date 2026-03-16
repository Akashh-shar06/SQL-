
CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'John', 'Brown', 32, 'IT', 65000, 'New York'),
(2, 'Jane', 'Wilson', 28, 'HR', 58000, 'Boston'),
(3, 'Alice', 'Johnson', 35, 'Sales', 72000, 'Chicago'),
(4, 'Bob', 'Martin', 42, 'Marketing', 54000, 'Boston'),
(5, 'Frank', 'Benson', 29, 'IT', 60000, 'New York'),
(6, 'Eve', 'Harris', 31, 'HR', 61000, 'Chicago'),
(7, 'Jack', 'Anderson', 45, 'Sales', 75000, 'New York'),
(8, 'Anna', 'Thompson', 27, 'Marketing', 56000, 'Boston'),
(9, 'Chris', 'Baker', 38, 'IT', 67000, 'Chicago'),
(10, 'Fiona', 'Nelson', 33, 'HR', 59000, 'New York');

-- 1. Employees whose age is between 30 and 40 and department is not Marketing
SELECT * FROM Employees WHERE Age BETWEEN 30 AND 40;

-- 2. Employees whose FirstName starts with "J" and Salary greater than 50000
SELECT * FROM Employees WHERE FirstName LIKE 'J%'AND Salary > 50000;

-- 3. Employees from Chicago or Boston who are older than 30
SELECT * FROM Employees WHERE City IN ('Chicago', 'Boston') AND Age > 30;

-- 4. Write a query to select employees who are in the HR department and either live in New York or have a salary greater than 60,000.
SELECT * FROM Employees WHERE Department IN ('HR') OR Salary > 60000 AND City IN ('New York');

-- 5. Write a query to find employees who are either from Sales or Marketing departments and are between 25 and 40 years old. 
SELECT * FROM Employees WHERE Department IN ('Sales' , 'Marketing') And Age Between 25 And 40;

-- 6. Write a query to select employees who are in the IT department and live in New York or are older than 35 years. 
SELECT * FROM Employees WHERE Department IN ('IT') AND City IN ('New York') OR Age > 35;

-- 7. Write a query to select employees whose Salary is greater than 55,000 and who are either in the HR or IT department. 
SELECT * FROM Employees WHERE Salary > 55000 AND Department IN ('HR' , 'IT');

-- 8. Write a query to find employees who live in New York or Chicago, and have a FirstName that starts with "A". 
SELECT * FROM Employees WHERE City IN ('New York','Chicago') AND FirstName LIKE 'A%';

-- 9. Write a query to select employees from either Boston or New York, whose Age is between 25 and 30. 
SELECT * FROM Employees WHERE City IN ('Boston','New York') AND Age BETWEEN 25 AND 30;

-- 10. Write a query to find employees who work in the IT or HR department and have a Salary greater than 60,000. 
SELECT * FROM Employees WHERE Department IN ('IT' , 'HR') AND Salary > 60000;

-- 11. Write a query to select employees whose FirstName starts with "A" and whose City contains "Ch". 
SELECT * FROM Employees WHERE FirstName LIKE 'A%' AND City LIKE '%CH%';

-- 12. Write a query to select employees whose LastName ends with "n" or whose FirstName contains the letter "a". 
SELECT * FROM Employees WHERE LastName LIKE '%N' OR FirstName LIKE 'A%';

-- 13. Write a query to select employees whose FirstName starts with "J" and whose LastName ends with "n". 
SELECT * FROM Employees WHERE FirstName LIKE 'J%' AND LastName LIKE '%N';

-- 14. Write a query to find employees whose City starts with "B" and whose Salary is less than 60,000. 
SELECT * FROM Employees WHERE City LIKE 'B%' AND Salary < 60000;

-- 15. Write a query to select employees whose FirstName starts with "A" or contains the letter "o" and who work in the HR department. 
SELECT * FROM Employees WHERE FirstName LIKE 'A%' OR  FirstName LIKE '%O%' AND Department IN ('HR');

-- 16. Write a query to select employees whose City ends with "n" and whose FirstName starts with "J". 
SELECT * FROM Employees WHERE City LIKE '%N' AND FirstName LIKE 'J%';

-- 17. Write a query to select employees whose City contains the letter "o" and whose LastName starts with "B". 
SELECT * FROM Employees WHERE City LIKE '%O%' AND LastName LIKE 'B%';

-- 18. Write a query to select employees whose LastName contains "h" and whose Age is greater than 30. 
SELECT * FROM Employees WHERE LastName LIKE '%H%' AND AGE > 30;

-- 19. Write a query to find employees whose FirstName contains the letter "a" or "e" and work in Sales or Marketing. 
SELECT * FROM Employees WHERE FirstName LIKE '%A%' OR FirstName LIKE '%E%' AND DEPARTMENT IN ('Sales' , 'Marketing');
 
-- 20. Write a query to select employees whose City contains the letter "o" and whose FirstName starts with "F". 
SELECT * FROM Employees WHERE City LIKE '%O%' AND FirstName LIKE 'F%';

-- 21. Write a query to select employees who work in HR, IT, or Sales departments and live in New York or Chicago. 
SELECT * FROM Employees WHERE Department IN ('HR' , 'IT' , 'Sales') AND City IN ('New York' , 'Chicago');

-- 22. Write a query to select employees who live in either New York or Boston, but whose Salary is not in the set (55000, 72000, 58000). 
SELECT * FROM Employees WHERE City IN ('New York' , 'Boston') OR Salary NOT IN ('55000' , '72000', '58000');

-- 23. Write a query to find employees who are not in the HR or Marketing departments, but whose Age is between 25 and 35. 
SELECT * FROM Employees WHERE Department NOT IN ('HR' , 'Marketing') OR Age BETWEEN 25 AND 35;

-- 24. Write a query to select employees whose Department is in the set ('Sales', 'HR', 'Marketing') and whose Salary is greater than 60,000. 
SELECT * FROM Employees WHERE Department IN ('Sales', 'HR', 'Marketing') AND Salary > 60000;

-- 25. Write a query to select employees whose EmployeeID is not in (1, 2, 5) and whose City is Chicago. 
SELECT * FROM Employees WHERE  EmployeeID NOT IN ('1', '2', '5') AND City IN ('Chicago');

-- 26. Write a query to select employees who are not in either the HR or IT department and are older than 40 years. 
SELECT * FROM Employees WHERE Department NOT IN ('HR' , 'IT') AND Age > 40;

-- 27. Write a query to select employees whose FirstName is in the set ('Alice', 'Bob', 'Eve') and whose Salary is less than 60,000. 
SELECT * FROM Employees WHERE FirstName IN ('Alice', 'Bob', 'Eve') AND Salary < 60000;

-- 28. Write a query to select employees who live in Boston or New York, but whose Department is not in ('Sales', 'HR'). 
SELECT * FROM Employees WHERE City IN ('Boston' , 'New York') AND  Department NOT IN ('Sales', 'HR');

-- 29. Write a query to find employees whose FirstName is in ('John', 'Jane', 'Frank') and Age is greater than 30. 
SELECT * FROM Employees WHERE FirstName IN ('John', 'Jane', 'Frank') AND Age > 30;

-- 30. Write a query to select employees whose Salary is not in the set (55000, 60000, 75000) and who work in the Sales department.
SELECT * FROM Employees WHERE Salary NOT IN ('55000', '60000', '75000') AND Department IN ('SaleS');



SELECT * FROM Employees;
