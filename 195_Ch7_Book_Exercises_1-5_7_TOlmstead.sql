/*
195
Ch7_Book_Exercises_1-5_7
Travis Olmstead
*/
use ap;
#1
select distinct vendor_name
from vendors 
where vendor_id in
(
	select vendor_id
	from invoices
)
order by vendor_name;
#2
select invoice_number, invoice_total, payment_total
from invoices
where payment_total >
(
	select avg(payment_total)
    from invoices
    where payment_total > 0
)
order by invoice_total desc;
#3
select account_number, account_description
from general_ledger_accounts gla
where Not Exists
(
	select account_number
    from invoice_line_items ili
    where ili.account_number = gla.account_number
)
order by account_number;
#4
select vendor_name, ili.invoice_id, invoice_sequence, line_item_amount
from invoice_line_items ili join invoices i
on ili.invoice_id = i.invoice_id
join vendors v on v.vendor_id = i.vendor_id
where ili.invoice_id in 
(
	select invoice_id
    from invoice_line_items
    where invoice_sequence > 1
);
#5
select vendor_id, max(invoice_total - payment_total - credit_total) as maxUnpaid
from invoices
where (invoice_total - payment_total - credit_total) > 0
group by vendor_id;

select sum(maxUnpaid)
from
(
	select vendor_id, max(invoice_total - payment_total - credit_total) as maxUnpaid
	from invoices
	where (invoice_total - payment_total - credit_total) > 0
	group by vendor_id
) unpaid;
#7
select vendor_name, invoice_number, invoice_date, invoice_total
from vendors v join invoices i 
on v.vendor_id = i.vendor_id
where i.invoice_date in
(
	select min(invoice_date)
	from invoices 
	where vendor_id = v.vendor_id
    group by vendor_id
)
order by v.vendor_name;