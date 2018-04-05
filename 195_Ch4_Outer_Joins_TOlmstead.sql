/*
195
Ch4_Outer_Joins
Travis Olmstead
*/
use ex;
#Show employees and the departments they are in. 
#Use the usual inner join, which will not show any employees that are not assigned to a department.
select last_name, first_name, department_name
from employees e join departments d
on e.department_number = d.department_number;
#Rewrite the previous question, showing all employees, whether or not they are assigned to a department.
select last_name, first_name, department_name
from employees e left join departments d
on e.department_number = d.department_number;
#Now show only employees that are not currently assigned to a department. You might want to research is null.
select last_name, first_name, department_name
from employees e left join departments d
on e.department_number = d.department_number
where department_name is null;