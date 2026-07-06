-- ============================================================
-- STUDENT MANAGEMENT SYSTEM - CRUD OPERATIONS
-- ============================================================

USE student_management_system;

-- CREATE
INSERT INTO Students (first_name, last_name, email, dob, gender, phone, dept_id, enrollment_year, gpa)
VALUES ('Rohan', 'Mathur', 'rohan.mathur@student.edu', '2003-05-01', 'M', '9876500041', 1, 2023, 0.00);

-- READ
SELECT * FROM Students WHERE dept_id = 1;

-- UPDATE
UPDATE Students SET gpa = 3.75 WHERE student_id = 41;

-- DELETE
DELETE FROM Enrollments WHERE enrollment_id = 999; -- example, no-op if not found
