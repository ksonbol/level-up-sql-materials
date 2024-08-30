-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE BookID in (
  SELECT BookID
  FROM Books
  WHERE Barcode in ('6435968624', '5677520613', '8730298424')
  )
AND ReturnedDate IS NULL; -- otherwise, this'd overwrite all the already-returned records!

SELECT b.Title, b.Barcode, l.ReturnedDate
FROM Loans l
JOIN Books b ON b.BookId = l.BookId
WHERE l.ReturnedDate = '2022-07-05'
AND Barcode in ('6435968624', '5677520613', '8730298424');