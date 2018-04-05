/*
195
195_Ch4_Book_Exercises_6-7
Travis Olmstead
*/
use ap;
#6
select g.account_number, account_description, invoice_id
from general_ledger_accounts g left join invoice_line_items i
on g.account_number = i.account_number
where invoice_id is null;
#7
select vendor_name, 'CA' as vendor_state
from vendors
where vendor_state = 'CA'
union
select vendor_name, 'Outside CA' as vendor_state
from vendors
where vendor_state <> "CA";
