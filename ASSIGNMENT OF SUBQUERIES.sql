CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DepartmentID INT,
    Salary INT,
    HireDate DATE
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    EmpID INT,
    ProjectName VARCHAR(50),
    HoursWorked INT,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

INSERT INTO Employees VALUES
(1, 'John Carter', 10, 60000, '2018-04-12'),
(2, 'Emma Stone', 20, 75000, '2016-11-01'),
(3, 'Ryan King', 10, 50000, '2019-07-19'),
(4, 'Sarah Lopez', 30, 82000, '2020-01-03'),
(5, 'Adam White', 20, 72000, '2017-05-30');

INSERT INTO Departments VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance');

INSERT INTO Projects VALUES
(101, 1, 'Alpha', 120),
(102, 2, 'Beta', 90),
(103, 3, 'Alpha', 110),
(104, 4, 'Delta', 150),
(105, 2, 'Gamma', 60);

SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Projects;


-- 1. Select all employees working in a department whose name contains ‘a’ (subquery + LIKE)
SELECT EmpID, EmpName
FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Departments
    WHERE DepartmentName LIKE '%a%'
);

-- 2. Find employees whose salary is higher than the average salary (subquery + aggregate)
SELECT EmpID, EmpName
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 3. List employees whose department has more than 1 employee (GROUP BY + HAVING)
SELECT EmpID, EmpName
FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 1
);

-- 4. Show employee names who worked on projects with more than 100 total hours (FIXED)
SELECT DISTINCT e.EmpName
FROM Employees e
JOIN Projects p ON e.EmpID = p.EmpID
WHERE p.ProjectID IN (
    SELECT ProjectID
    FROM Projects
    GROUP BY ProjectID
    HAVING SUM(HoursWorked) > 100
);

-- 5. Retrieve employees who are NOT assigned to any project (FIXED)
SELECT EmpID, EmpName
FROM Employees
WHERE EmpID NOT IN (
    SELECT DISTINCT EmpID FROM Projects
);

-- 6. Get departments that have no employees
SELECT DepartmentID, DepartmentName
FROM Departments
WHERE DepartmentID NOT IN (
    SELECT DepartmentID FROM Employees
);

-- 7. Employees hired after earliest employee in IT (MIN)
SELECT EmpID, EmpName, HireDate
FROM Employees
WHERE HireDate > (
    SELECT MIN(HireDate)
    FROM Employees
    WHERE DepartmentID = (
        SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT'
    )
);

-- 8. Salary greater than highest salary in HR (MAX)
SELECT EmpID, EmpName
FROM Employees
WHERE Salary > (
    SELECT MAX(Salary)
    FROM Employees
    WHERE DepartmentID = (
        SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR'
    )
);

-- 9. Second-highest salary (FIXED)
SELECT EmpID, EmpName, Salary
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (SELECT MAX(Salary) FROM Employees)
);

-- 10. Departments where total project hours > 200 (FIXED)
SELECT d.DepartmentID, d.DepartmentName
FROM Departments d
WHERE d.DepartmentID IN (
    SELECT e.DepartmentID
    FROM Employees e
    JOIN Projects p ON e.EmpID = p.EmpID
    GROUP BY e.DepartmentID
    HAVING SUM(p.HoursWorked) > 200
);

-- 11. Names start with same letter as highest-paid employee
SELECT EmpName
FROM Employees
WHERE EmpName LIKE (
    SELECT CONCAT(LEFT(EmpName,1),'%')
    FROM Employees
    WHERE Salary = (SELECT MAX(Salary) FROM Employees)
);

-- 12. Retrieve employees who share the same salary as at least one other employee
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary IN (
    SELECT Salary 
    FROM Employees 
    GROUP BY Salary 
    HAVING COUNT(*) > 1
);

-- 13. List employees who have worked more project hours than the average hours for their department
SELECT e.EmpID, e.EmpName 
FROM Employees e 
JOIN Projects p ON e.EmpID = p.EmpID 
WHERE p.HoursWorked > (
    SELECT AVG(p2.HoursWorked) 
    FROM Employees e2 
    JOIN Projects p2 ON e2.EmpID = p2.EmpID 
    WHERE e2.DepartmentID = e.DepartmentID
);

-- 14. List all employees whose salary is between the minimum and maximum salary in Finance
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary BETWEEN 
(SELECT MIN(Salary) FROM Employees WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Finance')) 
AND 
(SELECT MAX(Salary) FROM Employees WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Finance'));

-- 15. Retrieve departments where the average salary is above the overall company average
SELECT DepartmentID, DepartmentName 
FROM Departments 
WHERE DepartmentID IN (
    SELECT DepartmentID 
    FROM Employees 
    GROUP BY DepartmentID 
    HAVING AVG(Salary) > (SELECT AVG(Salary) FROM Employees)
);

-- 16. List employees working on the same projects as employee ‘Emma Stone’
SELECT DISTINCT e.EmpID, e.EmpName 
FROM Employees e
JOIN Projects p ON e.EmpID = p.EmpID
WHERE p.ProjectName IN (
    SELECT ProjectName 
    FROM Projects 
    WHERE EmpID = (SELECT EmpID FROM Employees WHERE EmpName = 'Emma Stone')
);

-- 17. List employees whose name length is longer than the average employee name length
SELECT EmpID, EmpName 
FROM Employees 
WHERE LEN(EmpName) > (SELECT AVG(LEN(EmpName)) FROM Employees);

-- 18. Show employees whose salary is a multiple of 5,000 and greater than the average salary for their department
SELECT EmpID, EmpName 
FROM Employees e 
WHERE Salary % 5000 = 0 
AND Salary > (
    SELECT AVG(Salary) 
    FROM Employees 
    WHERE DepartmentID = e.DepartmentID
);

-- 19. Get the employee who worked the maximum hours on any project
SELECT e.EmpID, e.EmpName 
FROM Employees e 
JOIN Projects p ON e.EmpID = p.EmpID 
WHERE p.HoursWorked = (SELECT MAX(HoursWorked) FROM Projects);

-- 20. Show employees whose project count is above the average project count
SELECT EmpID, EmpName 
FROM Employees 
WHERE EmpID IN (
    SELECT EmpID 
    FROM Projects 
    GROUP BY EmpID 
    HAVING COUNT(*) > (
        SELECT AVG(cnt) 
        FROM (SELECT COUNT(*) cnt FROM Projects GROUP BY EmpID) x
    )
);

-- 21. List employees in departments with the shortest department name
SELECT EmpID, EmpName 
FROM Employees 
WHERE DepartmentID IN (
    SELECT DepartmentID 
    FROM Departments 
    WHERE LEN(DepartmentName) = (
        SELECT MIN(LEN(DepartmentName)) FROM Departments
    )
);

-- 22. Show employees earning salaries in the top 20%
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary >= (
    SELECT MIN(Salary) 
    FROM (SELECT TOP 20 PERCENT Salary FROM Employees ORDER BY Salary DESC) x
);

-- 23. Show employees whose salary is NOT IN the top 3 salaries
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary NOT IN (
    SELECT TOP 3 Salary FROM Employees ORDER BY Salary DESC
);

-- 24. Retrieve employees whose department’s name begins with the same first letter as the employee’s name
SELECT e.EmpID, e.EmpName 
FROM Employees e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID 
WHERE d.DepartmentName LIKE LEFT(e.EmpName,1) + '%';

-- 25. List employees who worked on projects where hours worked is below the average for that project
SELECT DISTINCT e.EmpID, e.EmpName 
FROM Employees e 
JOIN Projects p ON e.EmpID = p.EmpID 
WHERE p.HoursWorked < (
    SELECT AVG(HoursWorked) 
    FROM Projects 
    WHERE ProjectID = p.ProjectID
);

-- 26. Show employees whose salary is greater than the salary of all employees in Finance
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary > ALL (
    SELECT Salary 
    FROM Employees 
    WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Finance')
);

-- 27. Show employees who earn more than at least one employee in HR
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary > ANY (
    SELECT Salary 
    FROM Employees 
    WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR')
);

-- 28. Get employees whose hire date is earlier than the average hire date of their department
SELECT EmpID, EmpName 
FROM Employees e 
WHERE HireDate < (
    SELECT AVG(HireDate) 
    FROM Employees 
    WHERE DepartmentID = e.DepartmentID
);

-- 29. Retrieve departments where the number of employees is NOT IN (2,3)
SELECT DepartmentID 
FROM Employees 
GROUP BY DepartmentID 
HAVING COUNT(*) NOT IN (2,3);

-- 30. Show employees whose salary rank is in the top 3
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary IN (
    SELECT DISTINCT TOP 3 Salary FROM Employees ORDER BY Salary DESC
);

-- 31. Find employees whose salary is above the average salary of their department
SELECT EmpID, EmpName 
FROM Employees e 
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employees 
    WHERE DepartmentID = e.DepartmentID
);

-- 32. List employees whose hire year matches the earliest hire year in the company
SELECT EmpID, EmpName 
FROM Employees 
WHERE YEAR(HireDate) = (
    SELECT YEAR(MIN(HireDate)) FROM Employees
);

-- 33. Retrieve employees working in departments where the department name appears more than once
SELECT EmpID, EmpName 
FROM Employees 
WHERE DepartmentID IN (
    SELECT DepartmentID 
    FROM Departments 
    GROUP BY DepartmentName, DepartmentID 
    HAVING COUNT(*) > 1
);

-- 34. Show employees whose salary equals the salary of at least one employee working in Finance
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary IN (
    SELECT Salary 
    FROM Employees 
    WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Finance')
);

-- 35. Show employee(s) who work on the most number of projects
SELECT EmpID, EmpName 
FROM Employees 
WHERE EmpID IN (
    SELECT TOP 1 EmpID 
    FROM Projects 
    GROUP BY EmpID 
    ORDER BY COUNT(*) DESC
);

-- 36. List employees whose project hours are greater than the average project hours for employee ID 2
SELECT DISTINCT e.EmpID, e.EmpName 
FROM Employees e 
JOIN Projects p ON e.EmpID = p.EmpID 
WHERE p.HoursWorked > (
    SELECT AVG(HoursWorked) FROM Projects WHERE EmpID = 2
);

-- 37. Find employees hired before every HR employee
SELECT EmpID, EmpName 
FROM Employees 
WHERE HireDate < ALL (
    SELECT HireDate 
    FROM Employees 
    WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR')
);

-- 38. List employees whose salary is NOT the minimum salary of their department
SELECT EmpID, EmpName 
FROM Employees e 
WHERE Salary > (
    SELECT MIN(Salary) 
    FROM Employees 
    WHERE DepartmentID = e.DepartmentID
);

-- 39. Show employees who share the same FIRST NAME as some other employee
SELECT EmpID, EmpName 
FROM Employees 
WHERE LEFT(EmpName, CHARINDEX(' ', EmpName)-1) IN (
    SELECT LEFT(EmpName, CHARINDEX(' ', EmpName)-1)
    FROM Employees
    GROUP BY LEFT(EmpName, CHARINDEX(' ', EmpName)-1)
    HAVING COUNT(*) > 1
);

-- 40. Retrieve employees whose salary is within 10% of the highest salary
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary >= (SELECT MAX(Salary) * 0.9 FROM Employees);

-- 41. Show employees who have never worked on project ‘Alpha’
SELECT EmpID, EmpName 
FROM Employees 
WHERE EmpID NOT IN (
    SELECT EmpID FROM Projects WHERE ProjectName = 'Alpha'
);

-- 42. Get the department where employees have the longest average employee name length
SELECT TOP 1 DepartmentID 
FROM Employees 
GROUP BY DepartmentID 
ORDER BY AVG(LEN(EmpName)) DESC;

-- 43. List employees whose salary is above the 75th percentile approximation
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary >= (
    SELECT MIN(Salary) 
    FROM (SELECT TOP 25 PERCENT Salary FROM Employees ORDER BY Salary DESC) x
);

-- 44. Show employees who earn more than the difference between the highest and lowest salaries in any department
SELECT EmpID, EmpName 
FROM Employees 
WHERE Salary > (
    SELECT MAX(Salary) - MIN(Salary) 
    FROM Employees 
    GROUP BY DepartmentID
);

-- 45. Retrieve employees whose EmpID appears in the top 50% of project assignments
SELECT EmpID, EmpName 
FROM Employees 
WHERE EmpID IN (
    SELECT TOP 50 PERCENT EmpID 
    FROM Projects 
    GROUP BY EmpID 
    ORDER BY COUNT(*) DESC
);
