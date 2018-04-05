/*
195
Function_Exercises
Travis Olmstead
*/
use customersAndProducts;

#1 
#a.
select fname, lname
from customerContacts;
#b.
select fname, lname
from customerContacts
where fname like 'A%' or fname like 'B%';
#c.
select fname, lname
from customerContacts
where fname like '%a%' and lname like 'L%';
#d.
select fname, lname
from customerContacts
where fname REGEXP '^[D-M]';
#e.
select fname, lname
from customerContacts
where UPPER(fname) like 'A%';
#2
select distinct 
CASE email 
when email not like '%.com%' then 'NO'
else 'YES'
END as answer
from customerContacts;
#3
select quantity, 
if (quantity <= 5, '$1.00',
if (quantity > 5 and quantity <= 10, '$3.00',
if (quantity > 10, '$5.00', ''))) as Query1
from orderLines;
#4
select email
from customerContacts
where email like '%hawk%' or email like '%hawkins%' or email like '%hawking%';
#5
select fname, lname
from customercontacts
where lname like 'T%' and length(lname) <= 8;
#6 
select concat(substring(lname, 1, length(lname) -1), upper(substring(lname, length(lname)))) as Person
from customerContacts;
#7
#a.
select date_format(NOW(), '%W, %M %e, %Y') as dateNow;
#b.
select date_format(NOW(), '%M %D, %Y') as dateNow;
#c.
select date_format(NOW(), '%W %l:%i %p') as dateNow;
#8
#a.
select date_format(date_add(NOW(), interval 1 month), '%m/%d/%y') as dateNow;
#b.
select date_format(date_add(NOW(), interval 10 week), '%m/%d/%y') as dateNow;
#c. 
select date_format(date_add(NOW(), interval 40 day), '%m/%d/%y') as dateNow;
#d.
select date_format(date_add(NOW(), interval -40 day), '%m/%d/%y') as dateNow;
#9
#a.
select date_format(date_add(NOW(), interval 100 hour), '%l:%i %p') as dateNow;
#b.
select date_format(date_add(NOW(), interval -100 hour), '%l:%i %p') as dateNow;
#10
select count(customerId)
from customerContacts
group by customerId;
#11
select count(orderId)
from orders
group by orderDate;
#12
select customerId, min(orderDate), orderId 
from orders
group by customerId, month(orderDate);
#13
select orderDate, count(orderId) 
from orders
group by orderDate
having count(orderId) > 1;
