-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

select count(o.orderID) as order_count, c.firstname, c.lastname, c.email from Orders o
Join Customers c on o.CustomerId = c.CustomerId
group by o.CustomerID
order by order_count desc
LIMIT 15;