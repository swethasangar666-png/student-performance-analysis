CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(30)
);

INSERT INTO students VALUES
(1, 'Anu', 'AI&DS'),
(2, 'Bala', 'AI&DS'),
(3, 'Charan', 'AI&DS'), 
(4, 'Divya', 'AI&DS'),
(5, 'Esha', 'AI&DS');
CREATE TABLE subjects (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(30)
);

INSERT INTO subjects VALUES
(1, 'Python'),
(2, 'DBMS'),
(3, 'Maths');

CREATE TABLE marks (
  mark_id INT PRIMARY KEY,
  student_id INT,
  subject_id INT,
  marks INT
);
INSERT INTO students VALUES
(6, 'Farhan', 'AI&DS'),
(7, 'Gayathri', 'AI&DS'),
(8, 'Hari', 'AI&DS'),
(9, 'Indu', 'AI&DS'),
(10, 'Jeeva', 'AI&DS');

INSERT INTO marks VALUES
(16, 6, 1, 72), (17, 6, 2, 68), (18, 6, 3, 75),
(19, 7, 1, 88), (20, 7, 2, 92), (21, 7, 3, 85),
(22, 8, 1, 55), (23, 8, 2, 40), (24, 8, 3, 47),
(25, 9, 1, 66), (26, 9, 2, 71), (27, 9, 3, 80),
(28, 10, 1, 38), (29, 10, 2, 50), (30, 10, 3, 44);
INSERT INTO marks VALUES
(1, 1, 1, 85), (2, 1, 2, 78), (3, 1, 3, 90),
(4, 2, 1, 62), (5, 2, 2, 55), (6, 2, 3, 48),
(7, 3, 1, 91), (8, 3, 2, 88), (9, 3, 3, 95),
(10, 4, 1, 45), (11, 4, 2, 52), (12, 4, 3, 60),
(13, 5, 1, 70), (14, 5, 2, 65), (15, 5, 3, 58);


-- Query 1: All students
SELECT * FROM students;

-- Query 2: Marks with student and subject names (JOIN)
SELECT s.name, sub.subject_name, m.marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id;

-- Query 3: Average marks per subject (GROUP BY)
SELECT sub.subject_name, AVG(m.marks) AS average_marks
FROM marks m
JOIN subjects sub ON m.subject_id = sub.subject_id
GROUP BY sub.subject_name;

-- Query 4: Top 5 students by total marks (ORDER BY, LIMIT)
SELECT s.name, SUM(m.marks) AS total_marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
GROUP BY s.name
ORDER BY total_marks DESC
LIMIT 5;

-- Query 5: Pass percentage per subject (pass mark 50)
SELECT sub.subject_name,
  ROUND(SUM(CASE WHEN m.marks >= 50 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS pass_percentage
FROM marks m
JOIN subjects sub ON m.subject_id = sub.subject_id
GROUP BY sub.subject_name;

-- Query 6: Students with average marks of 60 or more (HAVING)
SELECT s.name, ROUND(AVG(m.marks), 1) AS avg_marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
GROUP BY s.name
HAVING AVG(m.marks) >= 60
ORDER BY avg_marks DESC;