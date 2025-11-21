-- 1. Department Table
CREATE TABLE dept_info (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- 2. Professor Table
CREATE TABLE prof_info (
    prof_id SERIAL PRIMARY KEY,
    prof_name VARCHAR(100),
    dept_id INT REFERENCES dept_info(dept_id)
);

-- 3. Student Table
CREATE TABLE student_info (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(150),
    dept_id INT REFERENCES dept_info(dept_id)
);

-- 4. Course Table
CREATE TABLE course_info (
    course_id SERIAL PRIMARY KEY,
    course_title VARCHAR(100),
    prof_id INT REFERENCES prof_info(prof_id)
);

-- 5. Attendance Table
CREATE TABLE attendance_info (
    attendance_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student_info(student_id),
    course_id INT REFERENCES course_info(course_id),
    attend_date DATE,
    is_present BOOLEAN
);

-- 6. Marks Table
CREATE TABLE score_info (
    score_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student_info(student_id),
    course_id INT REFERENCES course_info(course_id),
    marks INT
);

INSERT INTO dept_info (dept_name) VALUES
('Computer Science'),
('Electronics'),
('Mechanical'),
('Mathematics');

INSERT INTO prof_info (prof_name, dept_id) VALUES
('Dr. A Kumar', 1),
('Dr. S Patel', 1),
('Dr. R Singh', 2),
('Ms. T Rao', 3),
('Mr. V Joshi', 4),
('Dr. N Mehta', 1),
('Ms. P Desai', 2),
('Mr. B Shah', 3),
('Dr. L Verma', 4),
('Ms. K Iyer', 2);

INSERT INTO student_info (student_name, email, dept_id) VALUES
('Anita Sharma','anita.sharma@example.com',1),
('Riya Patel','riya.patel@example.com',1),
('Meera Khan','meera.khan@example.com',2),
('Sonal Desai','sonal.desai@example.com',3),
('Rahul Singh','rahul.singh@example.com',1),
('Ishaan Gupta','ishaan.gupta@example.com',2),
('Priya Nair','priya.nair@example.com',4),
('Aakash Mehra','aakash.mehra@example.com',3),
('Tina Roy','tina.roy@example.com',4),
('Kabir Khan','kabir.khan@example.com',1);

INSERT INTO course_info (course_title, prof_id) VALUES
('Database Systems',1),
('Algorithms',2),
('Digital Electronics',3),
('Thermodynamics',4),
('Linear Algebra',5),
('Operating Systems',6),
('Microprocessors',7),
('Mechanics',8),
('Probability',9),
('Computer Networks',10);

INSERT INTO attendance_info (student_id, course_id, attend_date, is_present) VALUES
(1,1,'2025-07-21',TRUE),
(2,1,'2025-07-21',TRUE),
(3,3,'2025-07-21',FALSE),
(4,4,'2025-07-21',TRUE),
(5,2,'2025-07-21',TRUE),
(6,6,'2025-07-21',TRUE),
(7,5,'2025-07-21',FALSE),
(8,8,'2025-07-21',TRUE),
(9,9,'2025-07-21',TRUE),
(10,10,'2025-07-21',TRUE);

INSERT INTO score_info (student_id, course_id, marks) VALUES
(1,1,78),
(2,1,85),
(3,3,62),
(4,4,71),
(5,2,55),
(6,6,88),
(7,5,49),
(8,8,67),
(9,9,74),
(10,10,90);

SELECT * FROM student_info;

SELECT student_name, email
FROM student_info
WHERE dept_id = 1;

SELECT student_name
FROM student_info
WHERE student_name LIKE 'A%';

SELECT *
FROM score_info
WHERE marks BETWEEN 60 AND 90;

SELECT s.student_name, sc.marks
FROM score_info sc
JOIN student_info s ON sc.student_id = s.student_id
ORDER BY sc.marks DESC;

SELECT dept_id, COUNT(*) AS total_students
FROM student_info
GROUP BY dept_id;

SELECT s.student_name, d.dept_name
FROM student_info s
JOIN dept_info d ON s.dept_id = d.dept_id;

SELECT c.course_title, p.prof_name
FROM course_info c
LEFT JOIN prof_info p ON c.prof_id = p.prof_id;

SELECT c.course_title, p.prof_name
FROM course_info c
LEFT JOIN prof_info p ON c.prof_id = p.prof_id;

SELECT s.student_name, sc.marks
FROM score_info sc
RIGHT JOIN student_info s ON sc.student_id = s.student_id;

SELECT s.student_name, c.course_title, sc.marks
FROM student_info s
JOIN score_info sc ON s.student_id = sc.student_id
JOIN course_info c ON sc.course_id = c.course_id;














