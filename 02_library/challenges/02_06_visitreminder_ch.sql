-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT p.PatronId, p.firstname, p.email, count(l.LoanId) as cnt_checked
FROM Loans l
JOIN Patrons p ON l.PatronId = p.PatronId
GROUP BY p.PatronID
Having cnt_checked < 15
ORDER BY cnt_checked;
