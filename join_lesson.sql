# These are the join lesson notes

# Inner join gives us all A that exist in B, all B that exist in A, A and B
# 4 records of users with roles, roles with users
select * 
from users
join roles on roles.id = users.role_id;

# Left join, 6 users some have null role info
select *
from users # Left join means we get ALL the records from the first table we select (Table A)
left join roles on roles.id = users.role_id; # even if there's null info on Table B

# Right join, 5 rows
select *
from users # Right join gives us all the records from Table B, even if they have null on table A
right join roles on roles.id = users.role_id;


use quotes_db;

select * 
from dept_emp where dept_no = 'd005';

# Show all employees and the department names where they work
select *
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
join titles on titles.emp_no = employees.emp_no;
