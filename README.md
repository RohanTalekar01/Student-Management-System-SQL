# 🎓 Student Management System (SQL)

A relational database system built in **MySQL** to manage students, courses, instructors, and enrollments — designed with proper normalization, constraints, and reporting queries.

---

## 📌 Overview

This project models a typical academic institution's data using 5 related tables. It demonstrates core relational database concepts: schema design, data integrity constraints, CRUD operations, and analytical reporting using SQL.

---

## 🗂️ Database Schema

| Table | Description |
|---|---|
| `Departments` | List of academic departments |
| `Students` | Student personal info, department, GPA |
| `Instructors` | Faculty info linked to a department |
| `Courses` | Course catalog linked to department & instructor |
| `Enrollments` | Many-to-many link between students and courses, with grade & semester |

**Relationships**
- One department → many students
- One department → many instructors
- One department → many courses
- One instructor → many courses
- One student ↔ many courses (via `Enrollments`)

### Entity Relationship Diagram

---

## ⚙️ Features / What's Implemented

- ✅ Normalized schema with `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, and `ON DELETE/ON UPDATE` constraints
- ✅ Full **CRUD** operations (Create, Read, Update, Delete)
- ✅ Reporting queries using:
  - `JOIN` (INNER JOIN across multiple tables)
  - `GROUP BY` and `HAVING`
  - Aggregate functions: `COUNT()`, `AVG()`, `MAX()`
  - Subqueries (correlated and non-correlated)
- ✅ Sample dataset: 40+ students, 15 courses, 12 instructors, 8 departments, 60+ enrollment records

---


