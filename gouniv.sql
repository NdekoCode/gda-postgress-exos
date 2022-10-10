DROP DATABASE IF EXISTS gouniv;
​ -- Commande pour créer un utilisateur
CREATE USER admin;
CREATE USER doyen;
CREATE USER assistant;
​ CREATE DATABASE gouniv;
​ \ c gouniv;
​ -- -- Commande pour créer la table staff
CREATE TABLE staff (
    staff_no SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);
​ -- -- Commande pour créer la table course
CREATE TABLE course (
    course_code SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credit INT DEFAULT 0,
    quota INT DEFAULT 0,
    staff_no INT REFERENCES staff (staff_no)
);
​ -- -- Commande pour créer la table student
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    registered BOOL DEFAULT FALSE,
    region VARCHAR(100) DEFAULT 'INCONNUE',
    staff_no INT REFERENCES staff (staff_no)
);
-- -- Commande pour créer la table enrollement​
CREATE TABLE enrollment (
    student_id INT REFERENCES student (student_id),
    course_code INT REFERENCES course (course_code),
    date_enrolled DATE DEFAULT current_date,
    final_grade INT DEFAULT 0,
    PRIMARY KEY (student_id, course_code)
);
​ -- -- Commande pour créer la table assigment
CREATE TABLE assignment (
    assignment_no SERIAL,
    student_id INT REFERENCES student (student_id),
    course_code INT REFERENCES course (course_code),
    grade INT DEFAULT 0,
    PRIMARY KEY(assignment_no, student_id, course_code)
);
​ ALTER USER admin PASSWORD 'gouniv';
ALTER USER doyen PASSWORD 'gouni';
ALTER USER assistant PASSWORD 'gouniv';
​ ​ ALTER DATABASE gouniv OWNER TO admin;
ALTER DATABASE gouniv OWNER TO admin;
ALTER TABLE staff OWNER TO admin;
ALTER TABLE course OWNER TO admin;
ALTER TABLE student OWNER TO admin;
ALTER TABLE enrollment OWNER TO admin;
ALTER TABLE assignment OWNER TO admin;
​ REVOKE ALL PRIVILEGES ON DATABASE gouniv
FROM PUBLIC;
​
GRANT CONNECT ON DATABASE gouniv TO assistant,
    doyen;
GRANT ALL PRIVILEGES ON TABLE course,
    student TO doyen;
GRANT SELECT ON TABLE staff TO doyen;
GRANT SELECT ON TABLE course,
    student TO assistant;
​ -- -- Commande pour Insérer les données dans la table staff
INSERT INTO staff(name, region)
VALUES ('PA', 'Nord-kivu'),
    ('P0', 'Sud-kivu'),
    ('PHD', 'Kisangani'),
    ('PA', 'Kinshasa'),
    ('PE', 'Nord-kivu');
-- Commande pour Insérer les données dans la table course
INSERT INTO course(title, credit, quota, staff_no)
VALUES ('Programmation Mobile', 4, 20, 1);
,
('Programmation Web', 5, 15, 2);
('Machine Learning', 2, 20, 3);
('Parler en public', 4, 20, 4);
('Rediger un CV', 4, 30, 5);
​ -- Commande pour Insérer les données dans la table student
INSERT INTO student(name, region, staff_no)
VALUES ('Arick Bulakali', 'Bukavu', 4),
    ('Mutaliko Gloire', 'Bukavu kifebe', 1),
    ('Karugu Cedric', 'Goma Keshero', 3),
    ('Alexandre Notor', 'Himbi', 5),
    ('Alexis Ngabo', 'Himbi', 4);
​ -- Commande pour Insérer les données dans la table enrollement
INSERT INTO enrollment(student_id, course_code, final_grade)
VALUES (5, 1, 2),
    (5, 2, 1),
    (3, 5, 4),
    (5, 3, 3),
    (5, 5, 4);
​ -- Commande pour Insérer les données dans la table assigment
INSERT INTO assignment(student_id, course_code, grade)
VALUES (5, 5, 4),
    (2, 3, 2),
    (3, 3, 3),
    (4, 4, 1),
    (5, 3, 1)