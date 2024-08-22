-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

SELECT * from Customers WHERE FirstName = 'Loretta' AND LastName = 'Hundey';

-- We can use the CustomerID from previous query or use a subquery

INSERT INTO Orders (CustomerId, OrderDate)
VALUES (
(SELECT CustomerId from Customers WHERE FirstName = 'Loretta' AND LastName = 'Hundey'),
'2022-09-20 14:00:00'
);

SELECT * FROM Orders order by OrderDate DESC;

-- OrderID = 1001

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES
(1001, (SELECT DishID from Dishes WHERE Name LIKE '%House Salad%')),
(1001, (SELECT DishID from Dishes WHERE Name LIKE '%Mini Cheeseburgers%')),
(1001, (SELECT DishID from Dishes WHERE Name LIKE '%Tropical Blue Smoothie%'))
;

SELECT * From OrdersDishes WHERE OrderID = 1001;

SELECT Dishes.Name From OrdersDishes
JOIN Dishes ON OrdersDishes.DishID = Dishes.DishID
 WHERE OrderID = 1001;

SELECT sum(Price) FROM OrdersDishes
JOIN Dishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrderID = 1001;

-- Note: if we wanted, we can use DATETIME('now')


-- SELECT * FROM Orders WHERE OrderID = 1001;
-- DELETE FROM Orders WHERE OrderDate > DATETIME('2024-08-22');
