-- CREATE
-- CREATE TABLE students (
-- 	student_id INT AUTO_INCREMENT PRIMARY KEY,
-- 	full_name VARCHAR(50) NOT NULL,
-- 	email VARCHAR(100) UNIQUE,
-- 	birth_date DATE,
-- 	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
-- 
-- -- 컬럼 추가할 때
-- ALTER TABLE students ADD phone VARCHAR(20);
-- 
-- -- 컬럼 데이터 타입 수정
-- ALTER TABLE students MODIFY COLUMN full_name VARCHAR(100);
-- 
-- -- 테이블 삭제
-- DROP TABLE students;
-- 
-- -- INSERT
-- -- row 하나만 삽입한 예시
-- INSERT INTO students (full_name, email, birth_date)
--  	VALUES ('김일', 'kim1@test.com', '2026-02-12');
-- 
-- -- 여러 row 한 번에 삽입
-- INSERT INTO students (full_name, email)
-- 	VALUES ('김이', 'kim2@test.com'),
-- 			('김삼', 'kim3@test.com');
-- 
-- -- UPDATE
-- UPDATE students SET birth_date = '1990-01-01'
-- 	WHERE student_id = 2;
-- 
-- UPDATE students SET phone = '010-3698-2774'
-- 	WHERE student_id = 3;
-- 
-- -- DELETE
-- DELETE FROM students WHERE student_id = 4;


-- INSERT INTO students2(full_name, email) VALUES ('박일', 'park1@test.com');

-- UPDATE students2 SET full_name = '최영', email = 'choi0@test.com', birth_date = '1996-08-02', phone = '010-3698-2774'
-- 	WHERE student2_id = 2;

-- CREATE TABLE courses (
-- 	course_id INT AUTO_INCREMENT PRIMARY KEY,
-- 	course_name VARCHAR(100) NOT NULL,
-- 	professor VARCHAR(50),
-- 	credits INT DEFAULT 3);
-- 
-- INSERT INTO courses (course_name, professor, credits)
-- 	VALUES ('데이터베이스기초', '강교수', 3),
-- 			('자바프로그래밍', '이교수', 4),
-- 			('웹디자인', '박교수', 2);


-- INSERT INTO students (full_name, email, birth_date, phone)
-- 	VALUES ('kim1', 'kim1@test.com', '1990-01-01', '010-1111-1111'),
-- 			('kim2', 'kim2@test.com', '1990-02-02', '010-2222-2222');
-- 
-- INSERT INTO enrollments (student_id, course_id, enrollment_date)
-- 	VALUES (1, 1, '2026-02-01'),
-- 			(1, 2, '2026-02-01'),
-- 			(2, 1, '2026-02-02');


-- 김일 학생이 수강하고 있는 과목을 표시하고 등록 날짜도 표시하시오.
SELECT s.full_name, c.course_name, c.professor, e.enrollment_date FROM students s JOIN enrollments e ON s.student_id = e.student_id JOIN courses c ON c.course_id = e.course_id
	WHERE s.student_id = 1;

-- 1
INSERT INTO students (full_name, email, birth_date, phone)
	VALUES ('박지민', 'park@test.com', '1995-05-05', '010-5555-6666');

INSERT INTO courses (course_name, professor, credits)
	VALUES ('파이썬프로그래밍', '최교수', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date)
	VALUES (3, 1, '2026-02-12'),
			(3, 4, '2026-02-12');

-- 2
SELECT course_name FROM courses WHERE professor = '이교수';

SELECT full_name, phone FROM students WHERE email LIKE '%test.com';

SELECT full_name, e.enrollment_date, c.course_name FROM students s JOIN enrollments e ON s.student_id = e.student_id JOIN courses c ON c.course_id = e.course_id
	WHERE course_name = '데이터베이스기초';

-- 3
UPDATE students SET phone = '010-1597-7533'
	WHERE full_name = 'kim2';

UPDATE courses SET professor = '김교수'
	WHERE course_name = '웹디자인';

UPDATE courses SET credits = credits+1;

-- 4
DELETE FROM enrollments WHERE student_id = (SELECT student_id FROM students WHERE full_name = 'kim2');

DELETE FROM students WHERE full_name = 'kim2';

DELETE FROM courses WHERE course_id NOT IN (SELECT course_id FROM enrollments);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

DELETE FROM students WHERE student_id = 3;

SELECT * FROM students;