
--Book Table

CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100)
);

-- Authors Table
CREATE TABLE Authors (
    Author_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100)
);

-- Bridge table - many - to many ( Book to Authors)
CREATE TABLE BookAuthors (
    Book_ID INT,
    Author_ID INT,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
);


-- Members Table
CREATE TABLE Members (
    Member_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100)
);


--Borrow Table
CREATE TABLE Borrow (
    Borrow_ID SERIAL PRIMARY KEY,
    Book_ID INT,
    Member_ID INT,
    Borrow_Date DATE,
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);



-- inserting Values 

-- Books

INSERT INTO Books (Title) VALUES
('SQL for Dummies'),
('Learn Python'),
('Learn Java')


-- Jack Smith
-- Sam Lee
-- Mary Jones

-- Authors
INSERT INTO Authors (Name) VALUES
('Jack Smith'),
('Sam Lee'),
('Mary Jones')


-- link book and authors
INSERT INTO BookAuthors (Book_ID, Author_ID) VALUES
(1, 1), -- SQl for dummies by Jack Smith
(2, 2), -- Learn Python by Sam Lee
(3, 3) -- Learn Java by Mary 


-- John
-- Max

-- members
INSERT INTO Members (Name) VALUES
('John'),
('Max'),
('Alex')


--records
INSERT INTO Borrow (Member_ID, Book_ID, Borrow_Date) VALUES
(1, 1, '2025-01-01'), --YYYY-MM-DD
(2, 2, '2025-01-05') --YYYY-MM-DD


SELECT * from BookAuthors


--books with authors
SELECT b.Title, a.Name AS Authors FROM Books b JOIN BookAuthors ba ON b.Book_ID = ba.Book_ID
JOIN Authors a ON ba.Author_ID = a.Author_ID;


-- borrowed books and who borrowed them
SELECT m.Name AS Member, b.Title, br.Borrow_Date FROM Borrow br JOIN Members m ON br.Member_ID = m.Member_ID
JOIN Books b ON br.Book_ID = b.Book_ID;


--count 
SELECT m.Name, COUNT(*) AS Total_Borrowed FROM Borrow br JOIN Members m ON br.Member_ID = m.Member_ID
GROUP BY m.Name;








