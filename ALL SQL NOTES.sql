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
