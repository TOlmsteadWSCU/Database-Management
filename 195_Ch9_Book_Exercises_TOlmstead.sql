/*
195
Ch9_Book_Exercises
Travis Olmstead
*/
use ap;
#1
select invoice_total, round(invoice_total, 1), round(invoice_total, 0)
from invoices;
#2
use EX;
select date_format(start_date, '%b/%D/%y') as Date1, 
date_format(start_date, '%c/%e/%y') as Date2,
date_format(start_date, '%r') as Date3,
date_format(start_date, '%c-%b/%D/%y/%r') as Date4
from date_sample;
#3
use ap;
select vendor_name,upper(vendor_name), 
concat(substring(vendor_phone, 2, 3), '.', substring(vendor_phone, 7,3), '.', substring(vendor_phone, 11, 4)),
if(locate(' ', vendor_name) != 0, substring_index(substring_index(vendor_name, ' ', 2), ' ', -1), '')
from vendors;
#4
select invoice_number, invoice_date, date_add(invoice_date, interval 30 day), payment_date,
datediff(payment_date, invoice_date) as days_to_pay,
month(invoice_date),
year(invoice_date)
from invoices
where month(invoice_date) = 5;