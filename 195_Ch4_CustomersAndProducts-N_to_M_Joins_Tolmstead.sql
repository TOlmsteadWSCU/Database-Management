/*
195
Ch4_CustomersAndProducts-N_to_M_Joins
Travis Olmstead
*/
use CustomersAndProducts;
#1
select customerId, orderDate, productName, quantity, price
from orders o join orderLines ol
on o.orderId = ol.orderId
join products p 
on ol.productId = p.productId
where o.orderId = 3;
#2
select productName, sum(quantity * price) as totalSales
from orderLines ol join products p
on ol.productId = p.productId
where ol.orderId = 3;
#3
select customerName, o.orderId, sum(quantity)
from orders o join orderLines ol
on o.orderId = ol.orderId
join customers c on c.customerId = o.customerId
group by o.orderId
order by o.orderDate;
#4
select o.orderId, sum(quantity * price) as totals
from orders o join orderLines ol
on o.orderId = ol.orderId
join products p
on p.productId = ol.productId
group by o.orderId;
#5
select distinct productName
from orderLines ol join products p
on ol.productId = p.productId
join orders o on o.orderId = ol.orderId
where o.customerId = 'MXLDR';
#6
select customerId, o.orderId, productId, quantity, orderDate
from orders o join orderLines ol
on o.orderId = ol.orderId
where customerId = 'MSCRUS';
#7
select c.customerId, o.orderId, productId, quantity, orderDate
from orders o join customers c
on o.customerId = c.customerId
join orderLines ol
on o.orderId = ol.orderId
where customerName = 'Music R Us';
#8
select distinct email
from customers c join customerContacts cc
on c.customerId = cc.customerId
join orders o
on o.customerId = c.customerId
join orderLines ol
on o.orderId = ol.orderId
where productId = 'MINI';
#9
select distinct customerName
from customers c join customerContacts cc
on c.customerId = cc.customerId
join orders o
on o.customerId = c.customerId
join orderLines ol
on o.orderId = ol.orderId
where productId = 'MINI';
#10
select customerId, productId
from orders o join orderLines ol
on o.orderId = ol.orderId
where orderDate = '2006-01-23';
#11
select productName, sum(quantity * price) as totalPrice
from orderLines ol join products p
on p.productId = ol.productId
group by price;
#12
select distinct customerName, email
from customers c join customerContacts cc
on c.customerId = cc.customerId
join orders o
on o.customerId = c.customerId
where orderDate >= '2006-02-02'
group by customerName;
#13
#worked with Clara on #13
# Display the total amount bought and spent by MXLDR before the first of February, 2006.
select customerId, sum(quantity) as TotalSales, sum(quantity * price) as TotalPrice
from orderLines ol join products p
on ol.productId = p.productId
join orders o
on ol.orderId = o.orderId
where o.customerId = "MXLDR" and orderDate <= "2006-02-01";


