-- Register a customer for our Anniversary event.

-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.

INSERT INTO Responses (
  CustomerId, PartySize
) VALUES (
(SELECT CustomerID from Customers WHERE Email = 'atapley2j@kinetecoinc.com'), 3
);

UPDATE Responses
SET PartySize = 4;

SELECT * from Responses;
