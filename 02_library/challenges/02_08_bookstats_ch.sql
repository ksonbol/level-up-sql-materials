-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

-- Report 1: Note the "count(distinct(title))" here vs "count(title)
SELECT Published, count(distinct(title)) as num_books,
GROUP_CONCAT(DISTINCT(Title)) -- not available in all sql dialects
FROM Books
GROUP BY Published
ORDER BY num_books DESC;

-- Report 2
SELECT Title, Author, count(LoanID) as cnt_checked
FROM Books b
JOIN Loans l on b.BookID = l.BookID
GROUP BY Title, Author
ORDER BY cnt_checked DESC
LIMIT 5;
