-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

SELECT * FROM Customers
WHERE Email = 'smac@kinetecoinc.com';

-- Does not exist, create it!

INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES ('Sam', 'McAdams', 'smac@kinetecoinc.com', '555-555-1212');

SELECT * FROM Customers Order by CustomerId DESC;

INSERT INTO Reservations (CustomerId, Date, PartySize)
VALUES (103, '2022-08-12 18:00:00',5);

-- Note: There is also INSERT OR IGNORE INTO ... (in sqlite)

SELECT * FROM Reservations ORDER BY Date desc;

