/*
195
Ch4_CustomersAndProducts_1_to_N_Joins
Travis Olmstead
*/
use CustomersAndProducts;
#1
select customerName, orderDate 
from customers c join orders o
where o.customerId = c.customerId;
#2
select customerId, orderDate
from orders where customerId = 'MXLDR';
#4
select productId, customerId 
from orders o join orderLines ol
where o.customerId = 'SCI2000'
and o.orderId = ol.orderId;
#5
select distinct productId, customerId 
from orders o join orderLines ol
where o.customerId = 'SCI2000'
and o.orderId = ol.orderId;
#8
select productId, quantity
from orders o join orderLines ol
where o.orderId = ol.orderId 
and o.orderDate >= '2006-02-05';
#10
/*Return the MAXI's bought between January 1st and January 31st, 
the amount bought, 
and the day they were bought

Worked with Clara on number 10*/
select orderlines.productId, quantity, orders.orderDate
from orderlines join orders
on orders.orderId = orderlines.orderId
where orderDate >= '2006-01-01' and orderDate <= '2006-01-31'
and orderlines.productId = "MAXI";

