-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.
SELECT * from Books
where Title = 'Dracula';

SELECT count(title) from Books
where Title = 'Dracula';
-- There are 3 copies but how many are available for borrowing?

SELECT b.Title, l.ReturnedDate from Books b
JOIN Loans l on b.BookID = l.BookID
where b.Title = 'Dracula';

-- There are many records with only one without return DATE, so 2 are available
-- Let's do this in a better way
SELECT count(*) as num_borrowed, b.Title, l.ReturnedDate from Books b
JOIN Loans l on b.BookID = l.BookID
where b.Title = 'Dracula' and l.ReturnedDate is NULL;

-- so, 2 copies are borrowed, and 1 is available!
-- We can also do the subtraction with sql

SELECT
  (SELECT count(Books.title) FROM Books
   WHERE Title = 'Dracula') -
  (SELECT count(*) FROM Books b
   JOIN Loans l ON b.BookID = l.BookID
   WHERE b.Title = 'Dracula' AND l.ReturnedDate IS NULL)
  AS available_copies;