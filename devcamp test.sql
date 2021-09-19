use school; 

-- getting average grade of each professor
SELECT p.professor_name, AVG(g.grade) AS 'Average Grade'
FROM professors p
RIGHT JOIN course c
ON c.course_teacher_id = p.professor_id
RIGHT JOIN grades g 
ON g.grade_course_id = c.course_id
GROUP BY p.professor_name;

-- each student with the highest grade ever achieved 
SELECT s.student_name, MAX(g.grade) AS 'Highest grade'
FROM students s
RIGHT JOIN course c
ON c.course_student_id = s.student_id
RIGHT JOIN grades g
ON g.grade_course_id = c.course_id
GROUP BY s.student_name;

-- courses students enrolled in
SELECT c.course_name, COUNT(s.student_name) AS 'Students Enrolled'
FROM course c
RIGHT JOIN students s
ON c.course_student_id = s.student_id
GROUP BY c.course_name;


-- courses and their average grade
SELECT c.course_name, AVG(g.grade) AS 'Average grade'
FROM course c
RIGHT JOIN grades g
ON g.grade_course_id = c.course_id
GROUP BY c.course_name
ORDER BY AVG(g.grade) ASC;

-- course name with course professor, student name and the amount of courses together
-- honestly not very proud of this one need to get better at mysql
SELECT p.professor_name,  c.course_name, s.student_name,
(SELECT COUNT(*)
FROM course  
WHERE course_teacher_id = p.professor_id AND course_student_id = s.student_id
  ) AS 'Amount of Courses together'
FROM professors p
RIGHT JOIN students s 
ON s.students_teacher_id = p.professor_id
RIGHT JOIN course c 
ON c.course_teacher_id = p.professor_id
GROUP BY c.course_name;








