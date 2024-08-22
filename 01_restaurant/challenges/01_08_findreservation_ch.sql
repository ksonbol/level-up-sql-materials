-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th. (2022!!)
SELECT FirstName, LastName, PartySize, Date
from Reservations
JOIN Customers
ON Reservations.CustomerId = Customers.CustomerId
WHERE Customers.LastName LIKE 'St%'
AND Date(Reservations.Date) = '2022-06-14'
;
