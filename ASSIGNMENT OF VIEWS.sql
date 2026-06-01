CREATE TABLE employees ( 
    employee_id INT PRIMARY KEY, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    department_id INT, 
    salary INT, 
    hire_date DATE 
); 
 
CREATE TABLE departments ( 
    department_id INT PRIMARY KEY, 
    department_name VARCHAR(50) 
); 
 
CREATE TABLE customers ( 
    customer_id INT PRIMARY KEY, 
    customer_name VARCHAR(100), 
    city VARCHAR(50) 
); 
 
CREATE TABLE orders ( 
    order_id INT PRIMARY KEY, 
    customer_id INT, 
    order_date DATE, 
    total_amount INT 
); 

INSERT INTO departments VALUES 
(1, 'HR'), 
(2, 'IT'), 
(3, 'Finance'), 
(4, 'Sales'), 
(5, 'Marketing'), 
(6, 'Admin'), 
(7, 'Support'), 
(8, 'Operations'), 
(9, 'R&D'), 
(10, 'Logistics'); 

INSERT INTO employees VALUES 
(101, 'Alice',   'Anderson', 2, 75000, '2019-03-15'), 
(102, 'Bob',     'Brown',    1, 45000, '2021-07-10'), 
(103, 'Charlie', 'Carter',   3, 65000, '2018-11-20'), 
(104, 'David',   'Miller',   2, 85000, '2017-01-05'), 
(105, 'Eva',     'Turner',   4, 55000, '2020-06-25'), 
(106, 'Frank',   'Foster',   5, 40000, '2022-02-14'), 
(107, 'Grace',   'Walker',   3, 72000, '2019-09-01'), 
(108, 'Hannah',  'Cooper',   4, 48000, '2023-04-18'), 
(109, 'Ian',     'Parker',   2, 90000, '2016-12-30'), 
(110, 'Amy',     'Porter',   1, 52000, '2021-10-08'); 

INSERT INTO customers VALUES 
(201, 'Johnson Stores', 'New York'), 
(202, 'Anderson Corp',  'London'), 
(203, 'Wilson Traders', 'Paris'), 
(204, 'Robertson Ltd',  'Berlin'), 
(205, 'Peterson & Co',  'Chicago'), 
(206, 'Harrison Inc',   'New York'), 
(207, 'Nelson Group',   'Toronto'), 
(208, 'Jackson Mart',   'London'), 
(209, 'Thompson LLC',   'Sydney'), 
(210, 'Watson Retail',  'Dubai'); 

INSERT INTO orders VALUES 
(301, 201, '2023-01-10', 12000), 
(302, 202, '2023-02-05', 8000), 
(303, 203, '2023-02-20', 15000), 
(304, 204, '2023-03-15', 6000), 
(305, 205, '2023-04-01', 22000), 
(306, 206, '2023-04-18', 9500), 
(307, 207, '2023-05-03', 18000), 
(308, 208, '2023-05-20', 4000), 
(309, 209, '2023-06-10', 30000), 
(310, 210, '2023-06-25', 11000);

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM customers;
SELECT * FROM orders;


CREATE VIEW vw_employees_basic AS
SELECT 
    employee_id,
    first_name,
    last_name,
    department_id,
    salary,
    hire_date
FROM employees;
GO

CREATE VIEW vw_dept_salary AS
SELECT 
    department_id,
    SUM(salary) AS total_salary,
    AVG(salary) AS avg_salary,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;
GO

CREATE VIEW vw_employee_names AS
SELECT 
    employee_id,
    first_name + ' ' + last_name AS full_name,
    UPPER(first_name) AS first_name_upper,
    last_name
FROM employees;
GO

CREATE VIEW vw_high_salary_employees AS
SELECT 
    first_name,
    salary
FROM employees
WHERE salary > 50000;
GO

CREATE VIEW vw_above_avg_salary AS
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);
GO

CREATE VIEW vw_departments_no_employees AS
SELECT 
    d.department_id,
    d.department_name
FROM departments d
LEFT JOIN employees e 
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
GO

CREATE VIEW vw_customers AS
SELECT 
    customer_id,
    customer_name,
    city
FROM customers;
GO

CREATE VIEW vw_orders AS
SELECT 
    order_id,
    customer_id,
    order_date,
    total_amount
FROM orders;
GO

CREATE VIEW vw_orders_per_customer AS
SELECT 
    customer_id,
    SUM(total_amount) AS total_order_amount
FROM orders
GROUP BY customer_id;
GO

SELECT * FROM vw_employees_basic;
SELECT * FROM vw_dept_salary;
SELECT * FROM vw_employee_names;
SELECT * FROM vw_employees_basic;
SELECT * FROM vw_employees_basic;
SELECT * FROM vw_employees_basic;
SELECT * FROM vw_employees_basic;
SELECT * FROM vw_employees_basic;
SELECT * FROM vw_employees_basic;
SELECT * FROM vw_employees_basic;



--1. Select all employees whose name starts with 'A'. 
select * from vw_employee_names where full_name like 'A%';

-- 2. Display top 5 highest-paid employees
SELECT * FROM vw_top5_highest_paid ORDER BY salary DESC;

--3. Show employees ordered by salary descending.
select * from vw_employees_salary_desc Order by salary desc;

--4. Select employees whose salary is between 40,000 and 80,000. 
SELECT * FROM vw_employees_salary_range
WHERE salary BETWEEN 40000 AND 80000;

--5. Retrieve employees hired after 2020. 
SELECT * FROM vw_employees_hired_after_2020
WHERE hire_date > '2020-12-31';

--6. Select employees whose department is IN ('HR', 'IT'). 
CREATE VIEW vw_employees_dept AS 
select e.employee_id,
	   e.first_name,
	   e.last_name,
	   d.department_name,
	   e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name IN ('HR', 'IT');
GO

select * from vw_employees_dept;

--7. Display employees ordered by hire date ascending.
SELECT * 
FROM vw_employees_hiredate_asc
ORDER BY hire_date ASC;

--8. Show employees whose last name ends with 'er'.
select  * from vw_employee_names
where last_name LIKE '%er';
 
--9. Select employees whose salary is greater than the company average.
SELECT * FROM vw_salary_above_company_avg
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 10. Retrieve employees whose department_id is NOT IN a subquery.
SELECT *
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('HR', 'IT')
);

-- 11. Display total salary for each department.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- 12. Show average salary per department.
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- 13. Select departments where total salary exceeds 200,000.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 200000;

-- 14. Display departments with more than 5 employees.
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- 15. Show top 3 departments with highest total salary.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC;


-- 16. Display departments ordered by average salary descending.
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC;

-- 17. List departments with no employees.
SELECT d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- 18. Select customers whose name contains 'son'.
SELECT *
FROM customers
WHERE customer_name LIKE '%son%';

-- 19. Display customers NOT IN cities ('Paris', 'Berlin').
SELECT *
FROM customers
WHERE city NOT IN ('Paris', 'Berlin');

-- 20. Select customers whose city is not 'London'.
SELECT *
FROM customers
WHERE city <> 'London';

-- 21. Display customers ordered alphabetically.
SELECT *
FROM customers
ORDER BY customer_name ASC;

-- 22. Show distinct customer cities.
SELECT DISTINCT city
FROM customers;

-- 23. Retrieve orders where total_amount > 10,000.
SELECT *
FROM orders
WHERE total_amount > 10000;

-- 24. Display orders ordered by total_amount descending.
SELECT *
FROM orders
ORDER BY total_amount DESC;

-- 25. Retrieve orders NOT IN a given list of order IDs.
SELECT *
FROM orders
WHERE order_id NOT IN (301, 302, 303);

-- 26. Show total orders per customer.
SELECT customer_id, SUM(total_amount) AS total_orders
FROM orders
GROUP BY customer_id;

-- 27. Select top 5 customers by total order amount.
SELECT customer_id, SUM(total_amount) AS total_amount
FROM orders
GROUP BY customer_id
ORDER BY total_amount DESC


-- 28. Display employees earning above average salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 29. Select employees whose salary is greater than their department average.
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- 30. Display departments whose total salary is highest.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) = (
    SELECT MAX(total_salary)
    FROM (
        SELECT SUM(salary) AS total_salary
        FROM employees
        GROUP BY department_id
    ) AS dept_salary
);
