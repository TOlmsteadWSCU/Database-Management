/*
195
AggregatesGroupByAndMath
Travis Olmstead
*/
use CustomersAndProducts;
#1	What's the average quantity from orderLines?
select avg(quantity) as AverageQuantity
from orderLines;
#2	How many sales were there for MINIs, MIDIs and MAXIs? (one query only)
select count(productId), productId
from orderLines
group by productId;
#3	What's the average quantity per sale of MINIs, MIDIs and MAXIs? (one query only)
select avg(quantity) as AverageQuantity, productId
from orderLines
group by productId;
#4	4.	Assume a sales tax rate of .07. What's the cost of a product, the tax on a product and the sum of those two values? Use good column heading
select productName, price, (price * .07) as Tax, sum(price + (price*.07)) as Sum
from products
group by productName;
#5	How many sales of more than 2 were there for MINIs, MIDIs and MAXIs? (one query only)

#6	Display each product price * .43, round to the nearest dollar.
select productName, round(price * .43) as Price
from products;
#7	What's each product price * .43, rounded to the nearest penny.
select productName, round(price * .43, 2) as Price
from products;
#group by productName;
#8	How many items have we sold?
select sum(quantity) as TotalItems
from orderLines
group by orderId;
#9	How many items were sold on each order?]
select orderId, sum(quantity) as ItemsSold
from orderLines
group by orderId;
#10	How many orders were there for each customer?
select customerName as Customer, count(orderId) as Orders
from customers c
join orders o1
on c.customerId = o1.customerId
group by customerName;