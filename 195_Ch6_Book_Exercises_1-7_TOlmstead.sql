/*
195
Ch6_Book_Exercises_1-7
Travis Olmstead
*/
use ap;
#1
select v.vendor_id as vendor_id, sum(invoice_total)
from invoices i
join vendors v
on i.vendor_id = v.vendor_id
group by vendor_name;
#2
select vendor_name, sum(payment_total)
from invoices i
join vendors v
on i.vendor_id = v.vendor_id
group by vendor_name
order by payment_total desc;
#3
select vendor_name, count(v.vendor_id) as invoice_count, sum(invoice_total)
from invoices i
join vendors v
on i.vendor_id = v.vendor_id
group by vendor_name
order by count(v.vendor_id) desc;
#4
select account_description, count(line_item_description = gla.account_number) as line_items, sum(line_item_amount)
from general_ledger_accounts gla
join invoice_line_items i
on i.account_number = gla.account_number
group by gla.account_number
having count(line_item_description) > 1
order by sum(line_item_amount) desc;
#5
select invoice_date, account_description, count(line_item_description = gla.account_number) as line_items, sum(line_item_amount)
from general_ledger_accounts gla
join invoice_line_items ili
on ili.account_number = gla.account_number
join invoices i
on i.invoice_id = ili.invoice_id
where invoice_date between '2014-4-1' and '2014-06-30'
group by gla.account_number
having count(line_item_description) > 1
order by sum(line_item_amount) desc;
#6
select account_number, sum(line_item_amount) as line_items
from invoice_line_items
group by account_number with rollup;
#7
select vendor_name, count(distinct account_number)
from vendors v join invoices i
on v.vendor_id = i.vendor_id
join invoice_line_items ili
on ili.invoice_id = i.invoice_id
group by vendor_name
having count(distinct account_number) > 1;

