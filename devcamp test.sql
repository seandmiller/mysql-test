use school; 

INSERT INTO professors(professor_name, professor_subject)
VALUES ('Jeff', 'Science')

INSERT INTO students(student_name, students_teacher_id)
VALUES ('sean', 1)




INSERT INTO professors(professor_name, professor_subject)
VALUES ('Michelle', 'Math')

INSERT INTO students(student_name, students_teacher_id)
VALUES ('jon', 2)

INSERT INTO students(student_name, students_teacher_id)
VALUES ('jerry', 2)

INSERT INTO students(student_name, students_teacher_id)
VALUES ('Rick', 2)


INSERT INTO professors(professor_name, professor_subject)
VALUES ('MajorTaylor', 'History')

INSERT INTO students(student_name, students_teacher_id)
VALUES ('beth', 3)

INSERT INTO students(student_name, students_teacher_id)
VALUES ('Mork', 3)



INSERT INTO professors(professor_name, professor_subject)
VALUES ('Evan', 'Biology')

INSERT INTO students(student_name, students_teacher_id)
VALUES ('morty', 4)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Flat Earth Theory', 1, 1)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Flat Earth Theory', 1, 3)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Solving Enigma', 2, 2)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Solving Enigma', 2, 3)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Solving Enigma', 2, 4)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Civil War', 3, 5)


INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Civil War', 3, 7)


INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Civil War', 3, 5)


INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('is Bigfoot Real?', 4, 6)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('is Bigfoot Real?', 4, 8)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('is Bigfoot Real?', 4, 1)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('is Bigfoot Real?', 4, 2)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Star Wars', 1, 1)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Star Wars', 1, 2)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Star Wars', 1, 4)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Old Republic', 3, 5)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Old Republic', 3, 3)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('Old Republic', 3, 8)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('ComputerVision', 2, 1)


INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('ComputerVision', 2, 5)

INSERT INTO course(course_name, course_teacher_id, course_student_id)
VALUES ('ComputerVision', 2, 2)


INSERT INTO grades(grade_course_id, grade)
VALUES (1,0)

INSERT INTO grades(grade_course_id, grade)
VALUES (2,78)

INSERT INTO grades(grade_course_id, grade)
VALUES (3,2)

INSERT INTO grades(grade_course_id, grade)
VALUES (4,27)

INSERT INTO grades(grade_course_id, grade)
VALUES (5,57)

INSERT INTO grades(grade_course_id, grade)
VALUES (6,7)

INSERT INTO grades(grade_course_id, grade)
VALUES (7,37)

INSERT INTO grades(grade_course_id, grade)
VALUES (8,90)

INSERT INTO grades(grade_course_id, grade)
VALUES (9,14)

INSERT INTO grades(grade_course_id, grade)
VALUES (10,20)

INSERT INTO grades(grade_course_id, grade)
VALUES (11,2)

INSERT INTO grades(grade_course_id, grade)
VALUES (12,3)

INSERT INTO grades(grade_course_id, grade)
VALUES (13,100)

INSERT INTO grades(grade_course_id, grade)
VALUES (14,17)

INSERT INTO grades(grade_course_id, grade)
VALUES (15,93)

INSERT INTO grades(grade_course_id, grade)
VALUES (16,67)

INSERT INTO grades(grade_course_id, grade)
VALUES (17,4)

INSERT INTO grades(grade_course_id, grade)
VALUES (18,57)

INSERT INTO grades(grade_course_id, grade)
VALUES (19,10)

INSERT INTO grades(grade_course_id, grade)
VALUES (20,89)

INSERT INTO grades(grade_course_id, grade)
VALUES (21,16)

INSERT INTO grades(grade_course_id, grade)
VALUES (22,3)

INSERT INTO grades(grade_course_id, grade)
VALUES (23,100)



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








