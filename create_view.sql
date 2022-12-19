CREATE VIEW titles_per_author AS
SELECT 
    author.firstName,
    author.lastName, 
    DATEDIFF(year, author.birthDate, GETDATE()) AS age,
    (
        SELECT COUNT(*) 
        FROM books 
        WHERE books.authorID = author.ID
    ) AS total_books,
    CONCAT(
        (
            SELECT SUM(books.price) 
            FROM books 
            WHERE books.authorID = author.ID
        ), 
        ' kr'
    ) AS total_book_prices
FROM author
