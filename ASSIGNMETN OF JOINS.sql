CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(50), 
    Duration INT, 
    Fees DECIMAL(10,2) 
); 

CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(50), 
    Age INT, 
    City VARCHAR(40), 
    CourseID INT, 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
 
CREATE TABLE Payments ( 
    PaymentID INT PRIMARY KEY, 
    StudentID INT, 
    AmountPaid DECIMAL(10,2), 
    PaymentDate DATE, 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) 
); 

CREATE TABLE Teachers ( 
    TeacherID INT PRIMARY KEY, 
TeacherName VARCHAR(50), 
Subject VARCHAR(50), 
City VARCHAR(40) 
); 

INSERT INTO Courses VALUES 
(1, 'Python Programming', 4, 25000), 
(2, 'Java Full Stack', 6, 35000), 
(3, 'Data Science', 6, 45000), 
(4, 'Web Development', 5, 30000), 
(5, 'C++ Programming', 3, 20000), 
(6, 'Cyber Security', 6, 50000), 
(7, 'Excel & Power BI', 2, 15000), 
(8, 'Machine Learning', 6, 55000), 
(9, 'Tally + GST', 2, 12000), 
(10, 'Digital Marketing', 4, 28000); 

INSERT INTO Students VALUES 
(101, 'Aman Sharma', 22, 'Mumbai', 1), 
(102, 'Sneha Patel', 21, 'Pune', 3), 
(103, 'Rohan Mehta', 24, 'Delhi', 2), 
(104, 'Priya Yadav', 23, 'Mumbai', 7), 
(105, 'Arjun Nair', 25, 'Chennai', 3), 
(106, 'Simran Kaur', 20, 'Pune', 4), 
(107, 'Mohit Verma', 22, 'Delhi', 1), 
(108, 'Payal Gupta', 23, 'Ahmedabad', 6), 
(109, 'Raj Singh', 26, 'Kolkata', 5), 
(110, 'Ananya Das', 21, 'Mumbai', 8); 

INSERT INTO Payments VALUES 
(201, 101, 25000, '2025-01-10'), 
(202, 102, 45000, '2025-01-12'), 
(203, 103, 20000, '2025-01-15'), 
(204, 104, 15000, '2025-01-18'), 
(205, 105, 45000, '2025-01-20'), 
(206, 106, 30000, '2025-01-20'), 
(207, 107, 25000, '2025-01-22'), 
(208, 108, 50000, '2025-01-24'), 
(209, 109, 15000, '2025-01-26'), 
(210, 110, 55000, '2025-01-28'); 

INSERT INTO Teachers VALUES 
(301, 'Vikas Desai', 'Python Programming', 'Mumbai'), 
(302, 'Ritu Sharma', 'Java Full Stack', 'Delhi'), 
(303, 'Deepak Roy', 'Data Science', 'Pune'), 
(304, 'Shilpa Jain', 'Web Development', 'Mumbai'), 
(305, 'Harsh Gupta', 'C++ Programming', 'Kolkata'), 
(306, 'Kiran Shetty', 'Cyber Security', 'Chennai'), 
(307, 'Neha Mirza', 'Excel & Power BI', 'Pune'), 
(308, 'Raghav Singh', 'Machine Learning', 'Delhi'), 
(309, 'Sunil Kumar', 'Tally + GST', 'Ahmedabad'), 
(310, 'Alisha Khan', 'Digital Marketing', 'Mumbai');

SELECT * FROM Courses;
SELECT * FROM Students;
SELECT * FROM Payments;
SELECT * FROM Teachers;

-- 1. Display FullName and City of students living in Mumbai, ordered by name. 
SELECT FullName, City FROM Students WHERE City = 'Mumbai' ORDER BY FullName;

-- 2. List students whose names start with 'A', ordered by Age (DESC). 
SELECT * FROM Students WHERE FullName LIKE 'A%' ORDER BY Age DESC;

-- 3. Fetch StudentID, FullName, CourseName using INNER JOIN Students–Courses. 
SELECT s.StudentID , s.FullName , c.CourseName
FROM Students s
INNER JOIN Courses c 
ON s.CourseID = c.CourseID;

-- 4. Get students enrolled in courses IN ('Python', 'Java'). 
SELECT s.StudentID, s.FullName, c.CourseName
FROM Students s
INNER JOIN Courses c 
ON s.CourseID = c.CourseID
WHERE c.CourseName LIKE '%Python%'
OR c.CourseName LIKE '%Java%';

-- 5. Students whose city is NOT IN ('Delhi', 'Pune') ordered by city. 
SELECT * FROM Students WHERE City NOT IN ('Delhi' , 'Pune') ORDER BY City;

-- 6. Count the number of students in each city using GROUP BY City. 
SELECT City , COUNT(*) AS TotalStudent FROM Students GROUP BY City;

-- 7. Show CourseName with average fees more than 20000 using GROUP BY + HAVING. 
SELECT CourseName , AVG(Fees) AS AVGFees FROM Courses GROUP BY CourseName HAVING AVG(Fees) > 20000;

-- 8. Display names in UPPERCASE and city. 
SELECT UPPER(FullName) AS Name , City FROM Students;

-- 9. Show FullName with length of name ordered by longest first. 
--SELECT FullName, LENGTH(FullName) AS NameLength FROM Students ORDER BY NameLength DESC;

-- 10. List courses where CourseName LIKE '%Data%'. 
SELECT * FROM Courses WHERE CourseName LIKE '%Data%';

-- 11. List students who never paid using LEFT JOIN Payments + WHERE PaymentDate IS NULL. 
SELECT s.StudentID, s.FullName
FROM Students s
LEFT JOIN Payments p
ON s.StudentID = p.StudentID
WHERE p.PaymentDate IS NULL;

-- 12. List students who made payments using INNER JOIN. 
SELECT DISTINCT s.StudentID, s.FullName
FROM Students s
INNER JOIN Payments p
ON s.StudentID = p.StudentID;

-- 13. Calculate total payment amount per student using SUM + GROUP BY. 
SELECT s.StudentID, s.FullName, SUM(p.AmountPaid) AS TotalPayment
FROM Students s
INNER JOIN Payments p
ON s.StudentID = p.StudentID
GROUP BY s.StudentID, s.FullName;

-- 14. List Top 5 highest paying students using SUM + ORDER BY DESC + TOP. 
SELECT TOP 5 s.StudentID, s.FullName, SUM(p.AmountPaid) AS TotalPayment
FROM Students s
INNER JOIN Payments p
ON s.StudentID = p.StudentID
GROUP BY s.StudentID, s.FullName
ORDER BY TotalPayment DESC;

-- 15. Display courses with fees between 15000 and 30000, sorted by fees. 
SELECT * FROM Courses WHERE Fees BETWEEN 15000 AND 30000 ORDER BY Fees;

-- 16. Count teachers per city using GROUP BY City. 
SELECT City , COUNT(*) AS TotalTeachers FROM Teachers GROUP BY City;

-- 17. Display students whose FullName contains a space using LIKE '% %'. 
SELECT * FROM Students WHERE FullName LIKE '% %';

-- 18. Show CourseName & total student count per course using JOIN + GROUP BY. 
SELECT c.CourseName, COUNT(s.StudentID) AS TotalStudents
FROM Courses c
LEFT JOIN Students s 
ON c.CourseID = s.CourseID
GROUP BY c.CourseName;

-- 19. Students whose first name letter matches city first letter using LEFT(). 
SELECT * FROM Students WHERE LEFT(FullName,1) = LEFT(City,1);

-- 20. Display students who paid in January 2025 (PaymentDate LIKE '2025-01%'). 
SELECT s.StudentID, s.FullName, p.PaymentDate
FROM Students s
INNER JOIN Payments p 
ON s.StudentID = p.StudentID
WHERE p.PaymentDate LIKE '2025-01%';

-- 21. Show cities with more than 2 students using GROUP BY + HAVING. 
SELECT City, COUNT(*) AS TotalStudents FROM Students GROUP BY City HAVING COUNT(*) > 2;

-- 22. List teachers where Subject ends with 'Science' using LIKE '%Science'. 
SELECT * FROM Teachers WHERE Subject LIKE '%Science';

-- 23. Teachers whose city is NOT IN the list of cities from Students table. 
SELECT * FROM Teachers WHERE City NOT IN (SELECT DISTINCT City FROM Students);

-- 24. Show FullName without extra spaces using LTRIM(RTRIM(FullName)). 
SELECT LTRIM(RTRIM(FullName)) AS CleanName FROM Students;

-- 25. Display first 3 characters of CourseName using LEFT(CourseName, 3). 
SELECT LEFT(CourseName, 3) AS ShortName FROM Courses;

-- 26. Show student & number of payments using JOIN + COUNT() + GROUP BY. 
SELECT s.StudentID, s.FullName, COUNT(p.PaymentID) AS TotalPayments
FROM Students s
LEFT JOIN Payments p 
ON s.StudentID = p.StudentID
GROUP BY s.StudentID, s.FullName;

-- 27. Students whose total paid < fees using JOIN Students–Courses–Payments + WHERE. 
SELECT s.StudentID, s.FullName, SUM(p.AmountPaid) AS TotalPaid, c.Fees
FROM Students s
INNER JOIN Courses c 
ON s.CourseID = c.CourseID
INNER JOIN Payments p 
ON s.StudentID = p.StudentID
GROUP BY s.StudentID, s.FullName, c.Fees
HAVING SUM(p.AmountPaid) < c.Fees;

-- 28. Show all courses even if no students using RIGHT JOIN Students. 
SELECT c.CourseName , s.FullName FROM Students s RIGHT JOIN Courses c ON S.CourseID = C.CourseID;

-- 29. Display City & total payment amount using SUM + GROUP BY City. 
SELECT s.City , SUM(p.AmountPaid) AS TotalPayment FROM Students s INNER JOIN Payments p ON s.StudentID = p.StudentID GROUP BY s.City;

-- 30. Get student + course + teacher details using triple INNER JOIN. 
SELECT s.FullName , c.CourseName, t.TeacherName FROM Students s INNER JOIN Courses c ON s.CourseID = C.CourseID INNER JOIN Teachers t ON c.CourseName =t.subject;


-- SECTION 2 ----

-- 1. StudentID, FullName, CourseName using INNER JOIN, ordered by name.
SELECT s.StudentID, s.FullName, c.CourseName
FROM Students s
INNER JOIN Courses c ON s.CourseID = c.CourseID
ORDER BY s.FullName;

-- 2. Students whose name starts with 'S' and enrolled in 'Python' using JOIN + LIKE. 
SELECT s.StudentID, s.FullName, c.CourseName
FROM Students s
INNER JOIN Courses c ON s.CourseID = c.CourseID
WHERE s.FullName LIKE 'S%' 
AND c.CourseName LIKE '%Python%';

-- 3. Show courses with no students using LEFT JOIN + WHERE StudentID IS NULL. 
SELECT c.CourseName
FROM Courses c
LEFT JOIN Students s ON c.CourseID = s.CourseID
WHERE s.StudentID IS NULL;

-- 4. Count total students per course using JOIN + GROUP BY CourseName.
SELECT c.CourseName, COUNT(s.StudentID) AS TotalStudents
FROM Courses c
LEFT JOIN Students s ON c.CourseID = s.CourseID
GROUP BY c.CourseName;

-- 5 Students from IN ('Mumbai', 'Pune', 'Delhi') using WHERE + IN.
SELECT *
FROM Students
WHERE City IN ('Mumbai','Pune','Delhi');

-- 6 Students NOT IN ('Mumbai', 'Chennai') using NOT IN. 
SELECT *
FROM Students
WHERE City NOT IN ('Mumbai','Chennai');

-- 7 Display CourseName and total amount collected using SUM + GROUP BY.
SELECT c.CourseName, SUM(p.AmountPaid) AS TotalCollection
FROM Courses c
INNER JOIN Students s ON c.CourseID = s.CourseID
INNER JOIN Payments p ON s.StudentID = p.StudentID
GROUP BY c.CourseName;

-- 8 Students who made more than 2 payments using GROUP BY + HAVING COUNT() > 2.
SELECT s.StudentID, s.FullName, COUNT(p.PaymentID) AS PaymentCount
FROM Students s
INNER JOIN Payments p ON s.StudentID = p.StudentID
GROUP BY s.StudentID, s.FullName
HAVING COUNT(p.PaymentID) > 2;

-- 9 Students whose name contains 'an' and who made payments using LIKE + JOIN.
SELECT DISTINCT s.StudentID, s.FullName
FROM Students s
INNER JOIN Payments p ON s.StudentID = p.StudentID
WHERE s.FullName LIKE '%an%';

-- 10 Show TeacherName, City & total students in teacher’s city using JOIN + GROUP BY.
SELECT t.TeacherName, t.City, COUNT(s.StudentID) AS TotalStudents
FROM Teachers t
LEFT JOIN Students s ON t.City = s.City
GROUP BY t.TeacherName, t.City;

-- 11 Students who paid less than course fees using multi-join + WHERE fees > paid.
SELECT s.StudentID, s.FullName, SUM(p.AmountPaid) AS Paid, c.Fees
FROM Students s
INNER JOIN Courses c ON s.CourseID = c.CourseID
INNER JOIN Payments p ON s.StudentID = p.StudentID
GROUP BY s.StudentID, s.FullName, c.Fees
HAVING SUM(p.AmountPaid) < c.Fees;

-- 12. Students with no payments using LEFT JOIN + NULL filter. 	
SELECT s.StudentID, s.FullName
FROM Students s
LEFT JOIN Payments p ON s.StudentID = p.StudentID
WHERE p.StudentID IS NULL;

-- 13. Show City & student count > 3 using GROUP BY + HAVING COUNT() > 3. 
SELECT City, COUNT(*) AS TotalStudents
FROM Students
GROUP BY City
HAVING COUNT(*) > 3;

-- 14. Payments of students enrolled in IN ('Java', 'C++', 'Data Science') courses. 
SELECT s.StudentID, s.FullName, p.AmountPaid
FROM Students s
INNER JOIN Courses c ON s.CourseID = c.CourseID
INNER JOIN Payments p ON s.StudentID = p.StudentID
WHERE c.CourseName IN ('Java Full Stack','C++ Programming','Data Science');

-- 15. Display student + course + teacher using triple join, ordered by TeacherName. 
SELECT s.FullName, c.CourseName, t.TeacherName
FROM Students s
INNER JOIN Courses c ON s.CourseID = c.CourseID
INNER JOIN Teachers t ON c.CourseName = t.Subject
ORDER BY t.TeacherName;

-- 16. CourseName, MIN, MAX, AVG fees paid per course using GROUP BY. 
SELECT c.CourseName, 
MIN(p.AmountPaid) AS MinPaid,
MAX(p.AmountPaid) AS MaxPaid,
AVG(p.AmountPaid) AS AvgPaid
FROM Courses c
INNER JOIN Students s ON c.CourseID = s.CourseID
INNER JOIN Payments p ON s.StudentID = p.StudentID
GROUP BY c.CourseName;

-- 17. Students whose FullName ends with 'a' and payment > 20000 using LIKE + JOIN. 
SELECT s.StudentID, s.FullName, p.AmountPaid
FROM Students s
INNER JOIN Payments p ON s.StudentID = p.StudentID
WHERE s.FullName LIKE '%a' 
AND p.AmountPaid > 20000;

-- 18. Students who live in same city as teacher using JOIN + matching City. 
SELECT s.StudentID, s.FullName, t.TeacherName, s.City
FROM Students s
INNER JOIN Teachers t ON s.City = t.City;

-- 19. Students enrolled in course having 'Data' in course name but with no payment using LIKE + JOIN + NULL. 
SELECT s.StudentID, s.FullName, c.CourseName
FROM Students s
INNER JOIN Courses c ON s.CourseID = c.CourseID
LEFT JOIN Payments p ON s.StudentID = p.StudentID
WHERE c.CourseName LIKE '%Data%' 
AND p.StudentID IS NULL;

-- 20. Top 5 students with highest total payments using SUM + GROUP BY + ORDER BY DESC. 
SELECT TOP 5 s.StudentID, s.FullName, SUM(p.AmountPaid) AS TotalPaid
FROM Students s
INNER JOIN Payments p ON s.StudentID = p.StudentID
GROUP BY s.StudentID, s.FullName
ORDER BY TotalPaid DESC;
