# SQL-library-management
I designed a database for a library that manages books and their borrowings. The library keeps records of books, authors, library members, and the borrowing history of books. To be able to access data in a database we need to use SQL queries. SQL is the standard language used to interact with databases, allowing you to query, insert, update, and delete data. Here are some SQL queries that could be useful for this database:

**1-Retrieve a list of all books and their authors.**

SELECT 
    Books.Title AS BookTitle,
    Authors.Name AS AuthorName
FROM 
    Books
JOIN 
    Books_Authors ON Books.ISBN = Books_Authors.ISBN
JOIN 
    Authors ON Books_Authors.AuthorID = Authors.AuthorID;

**2-List books published by a specific publisher**

SELECT 
    Books.ISBN,
    Books.Title,
    Books.Genre,
    Books.PublicationYear,
    Publishers.Name AS PublisherName
FROM 
    Books
JOIN 
    Publishers ON Books.PublisherID = Publishers.PublisherID
WHERE 
    Publishers.Name = 'Scribner';

## Project Status: Completed


