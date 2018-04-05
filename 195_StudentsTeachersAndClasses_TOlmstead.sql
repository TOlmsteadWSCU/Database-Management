/*
195
StudentsTeachersAndClasses
Travis Olmstead
*/
use studentsClassesAndTeachers;
#1	Who is enrolled in Calc III?
select stuName
from students s
join studentsxclasses s1
on s.studentId = s1.studentId
join classes c
on s1.classId = c.classId
where className = 'Calc III';
#2	Who is teaching CS I?
select teachName
from teachers t
join teachersxclasses t1
on t.teacherId = t1.teacherId
join classes c1
on c1.classId = t1.classId
where className = 'CS I';
#3	What classes are H Keck teaching?
select className
from classes c1
join teachersxclasses t1
on c1.classId = t1.classId
join teachers t
on t.teacherId = t1.teacherId
where teachName = 'H Keck';
#4	What classes are Andrea taking?
select className
from classes c1
join studentsxclasses s1
on s1.classId = c1.classId
join students s
on s1.studentId = s.studentId
where stuName = 'Andrea';
#5	How many credits is K Fix teaching?
select sum(credits) as credits
from classes c1
join teachersxclasses t
on c1.classId = t.classId
join teachers t1
on t.teacherId = t1.teacherId
where teachName = 'K Fix';
#6	How many credits is Miller taking?
select sum(credits) as credits
from classes c1
join studentsxclasses s
on s.classId = c1.classId
join students s1
on s1.studentId = s.studentId
where stuName = 'Miller';
#7	What are Meghan's emails?
select email
from emails e
join students s1
on s1.studentId = e.studentId
where stuName = 'Meghan';
#8	How many emails does Stephen have?
select count(email) as NumberOfEmails
from emails e
join students s1
on s1.studentId = e.studentId
where stuName = 'Stephen';
#9	Does Ernest have an email? Yes or no	***************************
select if(count(email) > 0, 'yes', 'no') 
from students, emails
where students.studentId = emails.studentid and stuName = 'Ernest';
#10	What are the emails for the CS I students?
select stuName, email
from emails e
join students s1
on s1.studentId = e.studentId
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on s2.classId = c1.classId
where className = 'CS I';

/*
************************************************
Second Set of questions!!!!!!!!!
*/

#1	Who's teaching CS 1?
select teachName
from teachers t
join teachersxclasses t1
on t.teacherId = t1.teacherId
join classes c1
on c1.classId = t1.classId
where className = 'CS I';
#2	What classes are Andrea taking?  Show in order of Class name.
select className
from classes c1
join studentsxclasses s1
on c1.classId = s1.classId
join students s
on s.studentId = s1.studentId
where stuName = 'Andrea'
order by className;
#3	How many credits is K Fix teaching?
select sum(credits) as Credits
from classes c1
join teachersxclasses t
on c1.classId = t.classId
join teachers t1
on t1.teacherId = t.teacherId
where teachName = 'K Fix';
#4	How many credits is Miller taking?
select sum(credits) as Credits
from classes c1
join studentsxclasses s1
on c1.classId = s1.classId
join students s2
on s1.studentId = s2.studentId
where stuName = 'Miller';
#5	How many emails does Stephen have?
select count(email) as NumberOfEmails
from emails e
join students s1
on e.studentId = s1.studentId
where stuName = 'Stephen';
#6	What are Meghan's emails?
select email
from emails e
join students s1
on e.studentId = s1.studentId
where stuName = 'Meghan';
#7	How many classes is Miller taking?
select count(className) as Classes
from classes c1
join studentsxclasses s1
on c1.classId = s1.classId
join students s2
on s2.studentId = s1.studentId
where stuName = 'Miller';
#8	How many classes is K Fix teaching?
select count(className) as Classes
from classes c1
join teachersxclasses t1
on c1.classId = t1.classId
join teachers t2
on t1.teacherId = t2.teacherId
where teachName = 'K Fix';
#9	What are William's emails?
select email
from emails e
join students s1
on e.studentId = s1.studentId
where stuName = 'William';
#10	List all the names and emails of the CS I students?
select stuName, email
from students s1
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on s2.classId = c1.classId
join emails e
on s1.studentId = e.studentId
where className = 'CS I';
#11	What are the emails for K Fix's students?
select stuName, email
from students s1
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on c1.classId = s2.classId
join emails e
on s1.studentId = e.studentId
join teachersxclasses t1
on c1.classId = t1.classId
join teachers t2
on t1.teacherId = t2.teacherId
where teachName = 'K Fix';
#12	What students is J Peterson teaching?
select stuName as Students
from students s1
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on s2.classId = c1.classId
join teachersxclasses t1
on c1.classId = t1.classId
join teachers t2
on t1.teacherId = t2.teacherId
where teachName = 'J Peterson';
#13	What students is H Keck teaching?
select className, stuName
from students s1
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on s2.classId = c1.classId
join teachersxclasses t1
on t1.classId = c1.classId
join teachers t2
on t1.teacherId = t2.teacherId
where teachName = 'H Keck'
order by className;
#14	How many students is D Schuster teaching?
select count(stuName) as Students
from students s1
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on s2.classId = c1.classId
join teachersxclasses t1
on c1.classId = t1.classId
join teachers t2
on t1.teacherId = t2.teacherId
where teachName = 'D Schuster';
#15	What students are being taught by H Keck or K Fix?
select stuName, teachName
from students s1
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on s2.classId = c1.classId
join teachersxclasses t1
on c1.classId = t1.classId
join teachers t2
on t1.teacherId = t2.teacherId
where teachName = 'H Keck' or teachName = 'K Fix';
#16	What are the emails of the students that are in CS I?
select stuName, email
from students s1
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on s2.classId = c1.classId
join emails e
on s1.studentId = e.studentId
where className = 'CS I';
#17	What are the emails of students not in CS I?
select stuName, email
from students s1
join studentsxclasses s2
on s1.studentId = s2.studentId
join classes c1
on s2.classId = c1.classId
join emails e
on s1.studentId = e.studentId
where className != 'CS I';