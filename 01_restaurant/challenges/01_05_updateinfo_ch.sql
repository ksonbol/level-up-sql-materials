-- Update a customer's contact information.

-- Taylor Jenkins, of 27170 6th Ave., Washington, DC,
-- has moved to 74 Pine St., New York, NY.

SELECT * from Customers
WHERE FirstName = 'Taylor' AND LastName = 'Jenkins' AND City = 'Washington' AND State = 'DC';

UPDATE Customers
SET Address = '74 Pine St.',
    City = 'New York',
    State = 'NY'
WHERE FirstName = 'Taylor' AND LastName = 'Jenkins' AND City = 'Washington' AND State = 'DC';

Select * from Customers WHERE FirstName = 'Taylor' AND LastName = 'Jenkins';