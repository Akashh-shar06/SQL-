-- create a table name student with coloum like student id, fisrt name , last name , location , std , division , english marks , maths , geograpgh , science  
--CREATE DATABASE Students;


CREATE TABLE Student(
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Location VARCHAR(50),
    Std INT,
    Division CHAR(1),
    EnglishMarks INT,
    MathsMarks INT,
    GeographyMarks INT,
    ScienceMarks INT
);

INSERT INTO Student VALUES 
(1, 'Akash', 'Sharma', 'Jogeshwari', 9, 'A', 78, 98, 90, 87),(2, 'Akshit', 'Amin', 'Andheri', 10, 'B', 89, 56, 65, 45),
(3 , 'Yogesh', 'Rajput', 'vile parle' ,8 , 'B', 45, 63 , 65 , 85 ), (4, 'Yash', 'nair', 'Santacruz', 11, 'C', 98, 54, 25, 85),
(5, 'Rehan', 'khan', 'Khar road', 12, 'A', 87, 45, 21, 14), (6, 'Harsh', 'Singh', 'Bandra', 7, 'D', 45, 14, 25, 35),
(7, 'Bhavesh', 'Sharma', 'Dadar ', 10, 'A', 78, 45, 01, 64), (8, 'Ashish', 'Rajput', 'Mahim', 4, 'D', 56, 14, 28, 35),
(9, 'Sandip', 'Gupta', ' Ram mandir', 12, 'A', 58, 54, 47, 36), (10, 'Nitesh', 'Bishnoi', 'Bandra', 8, 'A', 45, 74, 44, 99);

Alter table Student add total int;

update Student set total = 100;
update Student set total = 400 where division = 'A' ;

Alter table Student Drop column total;

delete from Student where ScienceMarks > 50;

truncate table Student;

drop table Student;


----------------------------------------------------------------------------------------------


SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'A%';

SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '%H';

SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '%A%';

SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '_A%';

SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '%A_';


SELECT * FROM STUDENT WHERE STD = 10 AND SCIENCEMARKS > 50;

SELECT * FROM STUDENT WHERE STD = 12 OR MATHSMARKS > 30;

SELECT * FROM STUDENT WHERE ENGLISHMARKS BETWEEN 50 AND 100;

SELECT * FROM STUDENT WHERE DIVISION IN ('A' , 'B');

SELECT * FROM STUDENT WHERE DIVISION NOT IN ('A' , 'B');

SELECT * FROM Student;



