/*
195
studentsClassesAndTeachers Database
Travis Olmstead
*/

drop database if exists studentsClassesAndTeachers;   # perhaps left over from previous work
create database studentsClassesAndTeachers; 
use studentsClassesAndTeachers;  

create table students (
	studentId  smallint unsigned primary key auto_increment,
	stuName varchar(10)
);
insert into students (stuName) values ('Meghan'), ('Diane'), ('David'), ('Miller'), ('Dan'), ('William'), ('Lauren'),
 ('Andrea'), ('Stephen'), ('Roxanne'), ('Ernest');

create table teachers (
	teacherId smallint unsigned primary key auto_increment,
	teachName varchar(10)
);
insert into teachers (teachName) values ('H Keck'), ('J Peterson'), ('K Fix'), ('D Schuster');

create table emails (
	studentId smallint unsigned,
	email varchar(30),
	primary key (studentId, email)
);
insert into emails (studentId, email) values (1, 'meghan@western.edu'), (2, 'diane@gmail.com'),
 (2, 'diane@western.edu'), (2, 'diane@hotmail.com'), (3, 'david@gmail.com'), (4, 'miller@gmail.com'), 
(4, 'miller@western.edu'), (5, 'dan@western.edu'), (6, 'william@gmail.com'), (6, 'william@western.edu'), 
(6, 'william@hotmail.com'), (7, 'lauren@gmail.com'), (8, 'andrea@gmail.com'), (9, 'stephen@western.edu'), 
(9, 'stephen@gmail.com'), (10, 'roxanne@hotmail.com'), (10, 'roxanne@gigabyte.com');

create table classes (
	classId smallint unsigned primary key auto_increment,
	className varchar(30),
	credits tinyint
);
insert into classes (className, credits) values ('Calc III', 3), ('Automata', 4), ('CS I', 1);

create table studentsXclasses (
	studentId smallint unsigned,
	classId smallint unsigned,
	primary key(studentId, classId)
);
insert into studentsXclasses (studentId, classId) values (1, 1), (1, 2), (2, 1), (3, 1), (3, 2), (4, 1), (4, 3),
(5, 2), (6, 2), (7, 2), (8, 3), (9, 3), (10, 3), (11, 3);

create table teachersXclasses (
	teacherId smallint unsigned,
	classId smallint unsigned,
	primary key (teacherId, classId)
);
insert into teachersXclasses (teacherId, classId) values (1, 1), (2, 2), (1, 2), (3, 3), (4, 3);

select * from students;
select * from teachers;
select * from emails;
select * from classes;
select * from studentsXclasses;
select * from teachersXclasses;
