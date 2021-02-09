-- Day 7 ( day 3 of MySQL)
-- 'snow day', class was virtual

select c.id,c.name,o.Description,ol.Price,ol.Quantity, sum(ol.price * ol.quantity) subtotal
from customers c
join orders o on c.id = o.customerid
join orderlines ol on o.id = ol.OrdersId
-- where c.name in( 'kroger', 'P&G','fifth third bank')
group by c.id
order by c.name