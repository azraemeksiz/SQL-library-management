# SQL-library-management
I designed a database for a library that manages books and their borrowings. The library keeps records of books, authors, library members, and the borrowing history of books.
Here are some SQL queries that could be useful.
**To retrieve a list of all books and their authors.**

SELECT 
    Books.Title AS BookTitle,
    Authors.Name AS AuthorName
FROM 
    Books
JOIN 
    Books_Authors ON Books.ISBN = Books_Authors.ISBN
JOIN 
    Authors ON Books_Authors.AuthorID = Authors.AuthorID;

 **To display borrowing history for a specific book.**

SELECT 
    Books.Title AS BookTitle,
    Members.MemberID,
    Members.Name AS MemberName,
    Members.Email,
    Borrowing.BorrowDate,
    Borrowing.ReturnDate
FROM 
    Borrowing
JOIN 
    Members ON Borrowing.MemberID = Members.MemberID
JOIN 
    Books ON Borrowing.ISBN = Books.ISBN
WHERE 
Borrowing.ISBN = '9780439139601'; 

