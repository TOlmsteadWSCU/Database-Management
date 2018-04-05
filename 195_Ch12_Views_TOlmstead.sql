/*
195
Views
Travis Olmstead
*/
use CustomersAndProducts;
#1
create or replace view order_view as
select orderId, customerId, orderDate
from orders
order by customerId asc, orderDate desc;

select * from order_view;
#2
create or replace view order_date as
select orderId, customerId, orderDate as OUTSIDE
from orders
where orderDate not between '2006-01-26' and '2006-02-02';

select * from order_date;
#3
create or replace view customer_contact as
select lname, fname
from customercontacts
where lname = 'Roosevelt' 
xor fname = 'Franklin';

select * from customer_contact;
#4
create or replace view average as
select avg(quantity) as Average
from orderLines
group by productId;

select max(Average)
from average;
#5
create or replace view aaa as
select count(orderId) as countOrders, customerId
from orders
group by customerId;

select max(countOrders), customerId 
from aaa;
