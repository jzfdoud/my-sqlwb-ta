-- Day 6 (MySQL day2) contd.
-- Transaction examples

use PRSDBTA;
start transaction;
update requestLines set quantity = quantity+1 where id > 0;
rollback;
-- commit; 

select * from requestLines;

select 
 u.username 'Requesting User',v.name 'company',p.name 'product', rl.quantity,r.description 'request reason',r.deliveryMode,r.status,(p.price *rl.quantity) subtotal
-- showing request with request lines
-- r.description, sum(p.price *rl.quantity) subtotal
-- -- showing the total for an entire request
from users u
join requests r on u.id = r.userId
join requestLines rl on r.id = rl.requestId
join products p on rl.productId = p.id
join vendors v on p.vendorId =v.id
-- --group by r.description
