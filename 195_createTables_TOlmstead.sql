/*
195
createTables.sql
Travis Olmstead
*/

drop database if exists alumniTables;
 
create database alumniTables;

use alumniTables;
 


drop table if exists studentsXmajors;
drop table if exists emails;
drop table if exists private;
drop table if exists students; 
drop table if exists majors;

create table students
(
	
	studentId smallint primary key auto_increment,
    
	fname varchar(30),
    
	lname varchar(30)
	
);
 

create table private
(
    
	studentId smallint primary key,
    
	SSN varchar(11),
    
	str longtext,
	constraint c_private_students foreign key (studentId) references students (studentId) on delete cascade
	
);
 

create table emails
(
  
	emailId smallint primary key auto_increment,  
	studentId smallint,
	   
	email varchar(60) not null,

	constraint c_emails_students foreign key (studentId) references students (studentId) on delete cascade
	
);
 

create table majors
(
	
	majorId smallint primary key auto_increment,
	
	majorName varchar(10)

	);
 

create table studentsXmajors
(
	
	studentId smallint,
    
	majorId smallint
,
	constraint c_Xmajors_students foreign key (studentId) references students (studentId) on delete cascade,
	constraint c_Xstudents_majors foreign key (majorId) references majors (majorId) on delete cascade
	);
