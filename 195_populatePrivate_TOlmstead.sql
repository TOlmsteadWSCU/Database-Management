/*
195
populatePrivate.sql
Travis Olmstead
*/
use createTables;

insert into private (socialNumber) values ('123-45-6789');
set @garySSN_id = last_insert_id();
insert into private (socialNumber) values ('234-56-7891');
set @barbSSN_id = last_insert_id();
insert into private (socialNumber) values ('345-67-8911');
set @mikeSSN_id = last_insert_id();

insert into private (str) values ('do not contact');
set @garySTR_id = last_insert_id();
insert into private (str) values ('interested in donating');
set @barbSTR_id = last_insert_id();
insert into private (str) values ('working on PhD');
set @mikeSTR = last_insert_id();

insert into private (socialNumber, str) values (@garySSN_id, @garySTR_id);
insert into private (socialNumber, str) values (@barbSSN_id, @barbSTR_id);
insert into private (socialNumber, str) values (@mikeSSN_id, @mikeSTR_id);

