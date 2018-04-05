#195
#Ch3_Assign1
#Travis Olmstead
use ap;
#6
select vendor_name, vendor_contact_last_name, vendor_contact_first_name from vendors order by vendor_contact_last_name, vendor_contact_first_name;
#7
select concat(vendor_contact_last_name, ', ',vendor_contact_first_name) as full_name from vendors
where vendor_contact_last_name like 'a%' or vendor_contact_last_name like 'b%'
or vendor_contact_last_name like 'c%' or vendor_contact_last_name like 'e%' 
order by vendor_contact_last_name;
#8
select invoice_due_date as 'Due Date', invoice_total as 'Invoice Total',
invoice_total * 0.10 as '10%', invoice_total + (invoice_total * 0.10) as 'Plus 10%'
from invoices where invoice_total >= 500 and invoice_total <=1000;
#9  
select invoice_number, invoice_total, payment_total + credit_total as payment_credit_total,
(invoice_total - (payment_total + credit_total)) as balance_due from invoices
where (invoice_total - (payment_total + credit_total)) > 50 
order by (invoice_total - (payment_total + credit_total)) desc limit 5;
#10
select invoice_number, invoice_date, (invoice_total- (payment_total + credit_total)) as blance_due, payment_date
from invoices where payment_date is null;
#11
select current_date();
select date_format(current_date, '%m-%d-%Y') as 'mm-dd-yyyy';
select date_format(current_date, '%m-%d-%Y') as 'current_date';
#12
select 50000 as starting_principle, (50000 * .065) as interest, (50000 + (50000 * 0.065)) as principle_plus_interest;
