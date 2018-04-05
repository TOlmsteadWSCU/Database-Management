/*
195
Subqueries_1
Travis Olmstead
*/
#Write queries as if you know nothing about the database!!!
use CustomersAndProducts;
#ODD Numbered Problems
#1	Display the customerName for any customer that placed an order on or after Feb 5, 2006?
select distinct customerName 
from customers c
where c.customerId in
(
	select customerId from orders
	where orderDate >= '2006-02-05'
);
#3
select distinct productId
from orderLines o
where o.orderId in
(
	select orderId from orders
    where customerId = 'MXLDR'
);
#7
select productName
from products p
where not exists
(
	select productId from orderLines
);
#8
select distinct orderId
from orderLines o1
where quantity >
(
	select avg(quantity)
    from orderLines
);

select avg(quantity)
from orderLines
group by orderId;
#9
select email
from customercontacts
where customerId in
(
	select distinct customerId
    from orders
    where orderId in
    (
		select orderId
        from orderLines
        where productId = 'MINI'
    )
    
);
#11
select customerName
from customers
where customerId in
(
	select customerId from orderLines
    where customerId in
    (
		select email
		from customercontacts
		where email = 'gershwin@MSCRUS.com'
    )
    
);

