-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

-- in total, we have 30 books, but are they available?

SELECT DISTINCT(Title), Barcode
FROM Books
WHERE Published BETWEEN 1890 AND 1899
AND BookID NOT IN (
  SELECT b.BookID
  FROM Books b
  JOIN Loans l ON b.BookID = l.BookID
  WHERE l.ReturnedDate IS NULL
  AND b.Published > 1890 AND b.Published < 1899 --  PS: We can skip this condition if we have few books in total
);

-- note, better to use
-- WHERE Published BETWEEN 1890 AND 1899, than using
-- WHERE PUBLISHED > 1890 AND Published < 1899