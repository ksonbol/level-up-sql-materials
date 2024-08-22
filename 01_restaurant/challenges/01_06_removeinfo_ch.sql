-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

Select * from Customers where FirstName = 'Norby';

SELECT Date, Date(Date) from Reservations;

SELECT * from Reservations
WHERE CustomerId = '64'
AND DATE(Date) = '2022-07-29';

-- Alternatively, using Join
SELECT * from Reservations
join Customers
on Reservations.CustomerId = Customers.CustomerId
WHERE FirstName = 'Norby'
AND DATE(Date) = '2022-07-29';

DELETE FROM Reservations
WHERE ReservationID = 2000;