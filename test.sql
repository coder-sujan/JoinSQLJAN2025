-- Create a database
CREATE DATABASE Coder_testDB;

-- Then, connect to Coder_testDB and run:
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL
);


-- display students info * all...
SELECT * from users;
SELECT * from grades;

INSERT INTO users VALUES (1, 'Sujan', 'sujan@gmail.com')

INSERT INTO users VALUES (2, 'Jack', 'jack@gmail.com')

INSERT INTO users VALUES (3, 'Alex', 'alex@gmail.com')


-- SELECT students.name, grades.subjects, grades.score FROM students RIGHT JOIN grades ON students.std_id = grades.std_id;


-- Trying to connect both tables users = students 
-- connect that with grades

-- Then, connect to Coder_testDB and run:
CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    id INT,
    subject VARCHAR(100),
    score INT,
    FOREIGN KEY (id) REFERENCES users(id)
);


INSERT INTO grades VALUES (1, 1, 'Database', 50)




-- join tables (Right Join)
SELECT users.name, grades.subject, grades.score FROM users RIGHT JOIN grades ON users.id = grades.id;



-- join tables (Left Join)
SELECT users.name, grades.subject, grades.score FROM users LEFT JOIN grades ON users.id = grades.id;



-- join tables (Inner Join)
SELECT users.name, grades.subject, grades.score FROM users Inner JOIN grades ON users.id = grades.id;