 /*
195
populateTables.sql
Travis Olmstead
*/
use createTables;

insert into majors (major) values ('Law');
set @law_id = last_insert_id();
insert into majors (major) values ('CS');
set @cs_id = last_insert_id();
insert into majors (major) values ('Math');
set @math_id = last_insert_id();

insert into students (fname, lname) values ('Gary', 'Hudson');
set @gary_id = last_insert_id();
insert into students (fname, lname) values ('Barbara', 'Johnson');
set @barb_id = last_insert_id();
insert into students (fname, lname) values ('Mike', 'Lopez');
set @mike_id = last_insert_id();

insert into emails (studentId, email) values (@gary_id, 'gary@hudsonlaw.com');
insert into emails (studentId, email) values (@gary_id, 'garyh@gmail.com');
insert into emails (studentId, email) values (@barb_id, 'barbara@johnsoneng.com');
insert into emails (studentId, email) values (@mike_id, 'mikeylikesit@gmail.com');
insert into emails (studentId, email) values (@mike_id, 'mikethebike@mc.com');

insert into studentsXmajors (majorId, studentId) values (@law_id, @gary_id);
insert into studentsXmajors (majorId, studentId) values (@cs_id, @gary_id);
insert into studentsXmajors (majorId, studentId) values (@cs_id, @barb_id);
insert into studentsXmajors (majorId, studentId) values (@math_id, @barb_id);
insert into studentsXmajors (majorId, studentId) values (@math_id, @mike_id);
insert into studentsXmajors (majorId, studentId) values (@law_id, @mike_id);



