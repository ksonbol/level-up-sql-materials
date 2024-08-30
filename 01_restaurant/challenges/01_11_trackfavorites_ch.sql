-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

select dishid from dishes where name LIKE 'Quinoa Salmon Salad';

-- DishID = 9

select * from customers
where firstname = 'Cleo' and lastname = 'Goldwater';

-- CustomerID = 42

UPDATE customers
SET favoritedish = 9
WHERE CustomerID = 42;

-- validate update
select * from customers
where CustomerID = 42;

-- or
select dishes.name from customers
join dishes on customers.favoritedish = dishes.DishID
where customers.CustomerID = 42;

-- Alternatively, writing all of this in one query
UPDATE customers
SET favoritedish = (select DishID from dishes where name = 'Quinoa Salmon Salad')
WHERE firstname = 'Cleo' and lastname = 'Goldwater';