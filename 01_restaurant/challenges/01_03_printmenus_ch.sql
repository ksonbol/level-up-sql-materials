-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
-- Create a report showing appetizers and beverages.
-- Create a report with all items except beverages.

select * from Dishes
order by Price;

select * from Dishes
where Type in ('Beverage', 'Appetizer')
order by Type;


select * from Dishes
where Type != 'Beverage'
order by Type;