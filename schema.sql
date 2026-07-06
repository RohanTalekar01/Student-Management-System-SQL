-- ============================================================
-- STUDENT MANAGEMENT SYSTEM - SCHEMA
-- Tables, Primary Keys, Foreign Keys, and Constraints
-- ============================================================

DROP DATABASE IF EXISTS student_management_system;
CREATE DATABASE student_management_system;
USE student_management_system;

CREATE TABLE Departments (
    dept_id      INT AUTO_INCREMENT PRIMARY KEY,
    dept_name    VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students (
    student_id   INT AUTO_INCREMENT PRIMARY KEY,
    first_name   VARCHAR(50)  NOT NULL,
    last_name    VARCHAR(50)  NOT NULL,
    email        VARCHAR(100) NOT NULL UNIQUE,
    dob          DATE         NOT NULL,
    gender       ENUM('M','F','Other') NOT NULL,
    phone        VARCHAR(15),
    dept_id      INT,
    enrollment_year INT NOT NULL,
    gpa          DECIMAL(3,2) DEFAULT 0.00 CHECK (gpa >= 0 AND gpa <= 4.00),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    email         VARCHAR(100) NOT NULL UNIQUE,
    dept_id       INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Courses (
    course_id     INT AUTO_INCREMENT PRIMARY KEY,
    course_code   VARCHAR(10) NOT NULL UNIQUE,
    course_name   VARCHAR(100) NOT NULL,
    credits       INT NOT NULL CHECK (credits BETWEEN 1 AND 6),
    dept_id       INT,
    instructor_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id    INT NOT NULL,
    course_id     INT NOT NULL,
    semester      VARCHAR(20) NOT NULL,
    grade         DECIMAL(4,2) CHECK (grade >= 0 AND grade <= 100),
    enrollment_date DATE NOT NULL,
    UNIQUE KEY unique_enrollment (student_id, course_id, semester),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
