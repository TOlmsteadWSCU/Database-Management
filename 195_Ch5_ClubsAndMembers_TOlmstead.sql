/*
195
Ch5_ClubsAndMembers
Travis Olmstead
*/
drop database if exists ClubsAndMembers;
create database ClubsAndMembers;
use ClubsAndMembers;
create table clubs
(
	clubId smallint primary key auto_increment,
    cname varchar(10)
    #what does auto increment mean
    
);
create table people
(
	peopleId smallInt primary key auto_increment,
    pname varchar(10)
);
create table membersXclubs
(
	clubId smallint,
    peopleId smallint
);
create table phone_numbers
(
	peopleId smallint, 
	phone varchar(12), 
	phoneId smallint primary key auto_increment
);

insert into clubs (cname) values ('ski');
set @ski_id = last_insert_id();
insert into clubs (cname) values ('mt bike');
set @bike_id = last_insert_id();
insert into clubs (cname) values ('snowboard');
set @snowboard_id = last_insert_id();
insert into clubs (cname) values ('skydiving');
set @sky_id = last_insert_id();

insert into people (pname) values ('Sam');
set @sam_id = last_insert_id();
insert into phone_numbers (peopleId, phone) value (@sam_id, '111-1111');
insert into people (pname) values ('Julie');
set @julie_id = last_insert_id();
insert into phone_numbers (peopleId, phone) value (@julie_id, '111-2222'), (@julie_id, '111-1111');
insert into people (pname) values ('Adam');
set @adam_id = last_insert_id();
insert into phone_numbers (peopleId, phone) value (@adam_id, '111-2222');
insert into people (pname) values ('Devon');
set @devon_id = last_insert_id();
insert into phone_numbers (peopleId, phone) value (@devon_id, '111-4444');
insert into people (pname) values ('Walt');
set @walt_id = last_insert_id();
insert into phone_numbers (peopleId, phone) value (@walt_id, '111-5555');
insert into people (pname) values ('Adrian');
set @adrian_id = last_insert_id();
insert into phone_numbers (peopleId, phone) value (@adrian_id, '111-4444');
insert into people (pname) values ('Quinn');
set @quinn_id = last_insert_id();
insert into phone_numbers (peopleId, phone) value (@quinn_id, '111-7777'), (@quinn_id, '222-1212');
insert into people (pname) values ('Winnifred');
set @winn_id = last_insert_id();
insert into phone_numbers (peopleId, phone) value (@winn_id, '111-1111');

insert into membersXclubs (clubId, peopleId) values (@ski_id, @sam_id);
insert into membersxclubs (clubId, peopleId) values (@ski_id, @julie_id),
(@bike_id, @julie_id), (@snowboard_id, @julie_id), (@sky_id, @julie_id);
insert into membersXclubs (clubId, peopleId) values (@ski_id, @adam_id);
insert into membersXclubs (clubId, peopleId) values (@ski_id, @devon_id),
(@bike_id, @devon_id);
insert into membersXclubs (clubId, peopleId) values (@snowboard_id, @walt_id),
(@sky_id, @walt_id);
insert into membersXclubs (clubId, peopleId) values (@snowboard_id, @adrian_id),
(@sky_id, @adrian_id);
insert into membersXclubs (clubId, peopleId) values (@snowboard_id, @quinn_id),
(@sky_id, @quinn_id);
insert into membersXclubs (clubId, peopleId) values (@ski_id, @winn_id);




#1  Who is in the ski club?
select c.clubId, cname, pname
from clubs c join membersXclubs m
on c.clubId = m.clubId
join people p
on p.peopleId = m.peopleId
where cname = 'ski';
#2
select c.clubId, cname, pname
from clubs c join membersXclubs m
on c.clubId = m.clubId
join people p
on p.peopleId = m.peopleId
where cname = 'snowboard';
#3
select c.clubId, cname, pname
from clubs c join membersXclubs m
on c.clubId = m.clubId
join people p
on p.peopleId = m.peopleId
order by clubId;
#4
select c.clubId, cname, pname
from clubs c join membersXclubs m
on c.clubId = m.clubId
join people p
on p.peopleId = m.peopleId
where pname = 'Sam';
#5
select pname, cname
from clubs c join membersXclubs m
on c.clubId = m.clubId
join people p
on p.peopleId = m.peopleId
order by pname;
#6
select pname, phone
from people p join phone_numbers n
on p.peopleId = n.peopleId
join membersXclubs m
on p.peopleId = m.peopleId
join clubs c
on c.clubId = m.clubId
where cname = 'ski';
#7
select pname, phone
from phone_numbers n join people p
on p.peopleId = n.peopleId
where phone = '111-2222';
#8
select pname, cname
from clubs c join membersXclubs m
on c.clubId = m.clubId
join people p
on p.peopleId = m.peopleId
join phone_numbers n
on n.peopleId = p.peopleId
where phone = '111-2222';
#9
select cname, count(pname) as Count
from people p join membersXclubs m
on p.peopleId = m.peopleId
join clubs c on c.clubId = m.clubId
group by cname;