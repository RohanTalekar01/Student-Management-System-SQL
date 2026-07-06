-- ============================================================
-- STUDENT MANAGEMENT SYSTEM - REPORTING QUERIES
-- JOINs, GROUP BY, HAVING, Aggregate Functions, Subqueries
-- ============================================================

USE student_management_system;

-- 1. List each student with their department and course enrollments
SELECT s.first_name, s.last_name, d.dept_name, c.course_name, e.grade
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY s.last_name;

-- 2. Average grade per course
SELECT c.course_name, ROUND(AVG(e.grade), 2) AS avg_grade, COUNT(e.student_id) AS total_students
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY avg_grade DESC;

-- 3. Departments with more than 5 enrolled students (HAVING)
SELECT d.dept_name, COUNT(s.student_id) AS student_count
FROM Departments d
JOIN Students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
HAVING COUNT(s.student_id) > 5;

-- 4. Top-performing student per department (subquery)
SELECT s.first_name, s.last_name, d.dept_name, s.gpa
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id
WHERE s.gpa = (
    SELECT MAX(s2.gpa) FROM Students s2 WHERE s2.dept_id = s.dept_id
);

-- 5. Students who scored above the overall average grade (subquery)
SELECT DISTINCT s.first_name, s.last_name, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.grade > (SELECT AVG(grade) FROM Enrollments);

-- 6. Instructors teaching more than 1 course
SELECT i.first_name, i.last_name, COUNT(c.course_id) AS courses_taught
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_id
HAVING COUNT(c.course_id) > 1;

-- 7. Course with highest enrollment (aggregate + ORDER BY + LIMIT)
SELECT c.course_name, COUNT(e.student_id) AS enrolled_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY enrolled_count DESC
LIMIT 1;

-- 8. Students who have NOT enrolled in any course (subquery with NOT IN)
SELECT student_id, first_name, last_name
FROM Students
WHERE student_id NOT IN (SELECT DISTINCT student_id FROM Enrollments);
