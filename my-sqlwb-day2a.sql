-- Day 6 (MySQL day2) contd.
-- Transaction examples

use PRSDBTA;
start transaction;
update requestLines set quantity = quantity+1 where id > 0;
rollback;
-- commit; 

select * from requestLines;

