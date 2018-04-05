#195
#Ch3_Assign2
#Travis Olmstead
USE ap;
#1
select date_format(current_date(), '%W, %M %e, %Y');
select date_format(current_date(), '%m/%d/%y');
select date_format(current_date(), 'Today\'s date is: %e-%b-%y');
#2
select * from vendors where vendor_name like '%x%';
#3
select * from vendors where vendor_state in ('CA', 'OR', 'WA');
#4
select 79 DIV 6;
select 79 MOD 6;
select pow(4.3,5.4);
#5
select round(79/6);
select round(79/6,2);
#6
select invoice_date, invoice_id, invoice_number from invoices where invoice_date between '2014-03-01' and '2014-06-01' order by invoice_date desc;
#7
select invoice_date, invoice_id, invoice_number from invoices where invoice_date > '2014-06-01' or invoice_date < '2014-03-01' order by invoice_date asc; 
#8
select invoice_date, invoice_id, invoice_number from invoices where invoice_date between '2014-03-01' and '2014-06-01' order by invoice_date asc;
#9
select invoice_date, invoice_id, invoice_number from invoices where invoice_date not between '2014-03-01' and '2014-06-01' order by invoice_date asc;
#10
select * from vendors where vendor_name like 'G%' order by vendor_name;
#11
select * from vendors where vendor_name like '%corp%';
#12
select * from vendors order by vendor_name limit 1, 10;
#13
select vendor_name from vendors order by vendor_name desc limit 112, 10;
#14
select * from vendors order by vendor_name desc limit 112, 5;
#15
select vendor_name from vendors where vendor_name like 'W%' and vendor_state = 'CA';
#16
select invoice_total, invoice_date, sin(invoice_total), sqrt(invoice_total) from invoices order by invoice_date;
#17
select truncate(SIN(radians(4)),3);
#18
select invoice_id, invoice_date, invoice_total from invoices where invoice_date between '2014-05-01' and '2014-05-31' and invoice_total between '400' and '1000';
#19
select vendor_name from vendors where vendor_name like '_____' or vendor_name like '______' or vendor_name like '_______' or vendor_name like '________';
#20
select vendor_name from vendors where char_length(vendor_name)<=8 and char_length(vendor_name) >=5;






