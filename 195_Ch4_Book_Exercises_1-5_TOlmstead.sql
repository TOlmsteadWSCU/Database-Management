/*
195
Ch4_1-5
Travis Olmstead
*/
use ap;
#1
select vendors.*, invoices.* 
from 
vendors inner join invoices on vendors.vendor_id = invoices.vendor_id;
#2
select vendor_name, invoice_number, invoice_date, (invoice_total - payment_total - credit_total) as balance_due
from
vendors v join invoices i on v.vendor_id = i.vendor_id
where (invoice_total - payment_total - credit_total) > 0;
#3
select vendor_name, default_account_number, account_description as description
from vendors v join general_ledger_accounts g
on v.default_account_number = g.account_number
order by account_description, vendor_name;
#4
select vendor_name, invoice_date, invoice_number, invoice_sequence as li_sequence, line_item_amount as li_amount
from vendors v, invoices i, invoice_line_items li
where i.invoice_id = li.invoice_id and v.vendor_id = i.vendor_id
order by vendor_name, i.invoice_date, i.invoice_number, li.invoice_sequence;
#5
select distinct v1.vendor_id, v1.vendor_name, concat(v1.vendor_contact_first_name, " ", v1.vendor_contact_last_name) as contact_name
from vendors v1 join vendors v2
where v1.vendor_contact_last_name = v2.vendor_contact_last_name
and v1.vendor_id <> v2.vendor_id
order by v1.vendor_contact_last_name;

