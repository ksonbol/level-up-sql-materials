-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

-- Since we have the unique barcode, we can get the exact copy as follows
SELECT * from Books where BarCode = '2855934983';

-- assuming emails are also unique
-- don't set ReturnedDate (i.e. set it to NULL)
INSERT INTO Loans (BookId, PatronID, LoanDate, DueDate)
  VALUES (
    (SELECT BookID
     from Books
     where BarCode = '2855934983'),
    (SELECT PatronID from Patrons
     where Email = 'jvaan@wisdompets.com'),
    '2022-08-25',
    '2022-09-08'
    ),
    (
    (SELECT BookID from Books
     where Barcode = '4043822646'),
    (SELECT PatronID from Patrons
     where Email = 'jvaan@wisdompets.com'),
    '2022-08-25',
    '2022-09-08');

SELECT * from Loans
JOIN BOOKS ON Loans.BookID = Books.BookID
ORDER BY LoanID DESC
LIMIT 5;

----
-- In case, we didn't know the barcode of the specific copy
-- We first need to find which copies to loan
SELECT * from Books where title = 'The Picture of Dorian Gray';
-- So, 3 copies in total

-- find copies that are loaned
SELECT count(*) from Books b
JOIN Loans l On b.BookID = l.BookID
where b.Title = 'The Picture of Dorian Gray' and l.ReturnedDate IS NULL;

-- all are available, but let's write this in one query

-- Get all available BookIDs, or limit 1 to get only the first one (at random)
SELECT BookID from Books
WHERE Title = 'The Picture of Dorian Gray'
AND BookID NOT IN (
  SELECT b.BookID from Books b
  JOIN Loans l On b.BookID = l.BookID
  where b.Title = 'The Picture of Dorian Gray' and l.ReturnedDate IS NULL)
  LIMIT 1;

-- 11 is the book id we need
-- We can do the same for the other book
SELECT BookID from Books
WHERE Title = 'Great Expectations'
AND BookID NOT IN (
  SELECT b.BookID from Books b
  JOIN Loans l On b.BookID = l.BookID
  where b.Title = 'Great Expectations' and l.ReturnedDate IS NULL)
  LIMIT 1;

-- 23 is the book id we need
-- We can use those as subqueries in the main query