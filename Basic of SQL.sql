-- Create Database
CREATE DATABASE Student;

-- Use Database
USE Student;

-- Create Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    StudentDept VARCHAR(100) NOT NULL
);

-- Insert values for ALL columns
INSERT INTO Students
VALUES (1, 'Akash Sharma' , 'BSC-CS'),(2, 'Akshit Amin' , 'BSC-CS');

-- Corrected insert
INSERT INTO Students(StudentID, StudentName, StudentDept)
VALUES (3, 'Yogesh Rajput', 'BSC-IT');

SELECT * FROM Students;
