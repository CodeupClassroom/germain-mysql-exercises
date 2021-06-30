# These are the join exercises for the join lesson

# Exercise 2
select dept_name as "Department Name", concat(first_name, " ", last_name) as "Department Manager"
from employees
join dept_manager using(emp_no)
join departments using(dept_no)
where dept_manager.to_date > curdate();

# Exercise 3, find name of all departments managed by women
select dept_name as "Department Name", concat(first_name, " ", last_name) as "Manager Name"
from departments
join dept_manager using(dept_no)
join employees using(emp_no)
where dept_manager.to_date > curdate()
and gender = "F";

# Exercise 4, Find  the current titles of employees currently working in the Customer Service department.
select title, count(title)
from dept_emp
join departments using(dept_no)
join titles using(emp_no)
where departments.dept_name = "Customer Service"
and dept_emp.to_date > curdate()
and titles.to_date > curdate()
group by title
order by title;


-- Exercise 5. Find the current salary of all current managers.
select dept_no, salary, concat(first_name, " ", last_name) as "Current Manager"
from salaries
join dept_manager using(emp_no)
join employees using(emp_no)
join departments using(dept_no)
where dept_manager.to_date > curdate()
and salaries.to_date > curdate();

# Exercise 6
# Find the number of current employees in each department.
select dept_no, dept_name, count(*) as num_employees
from departments
join dept_emp using(dept_no)
where to_date > curdate()
group by dept_no
order by dept_no;

# Exercise 7 
# Which department has the highest average salary? Hint: Use current not historic information.

select dept_name, avg(salary) as average_salary
from salaries
join dept_emp using(emp_no)
join departments using(dept_no)
where dept_emp.to_date > curdate()
and salaries.to_date > curdate()
group by dept_name
order by average_salary DESC;

# Exercise 8
# Who is the highest paid employee in the Marketing department? 
select first_name, last_name, salary
from departments
join dept_emp using(dept_no)
join salaries using(emp_no)
join employees using(emp_no)
where salaries.to_date > curdate()
and dept_emp.to_date > curdate()
and dept_name = "Marketing"
order by salary DESC
limit 1;


# Exercise 9
# Which current department manager has the highest salary?
select first_name, last_name, salary, dept_name
from salaries
join dept_manager using(emp_no)
join departments using(dept_no)
join employees using(emp_no)
where salaries.to_date > curdate()
and dept_manager.to_date > curdate()
order by salary DESC
limit 1;

# 10 BONUS
# Find the names of all current employees, their department name, and their current manager's name.

select concat(managers.first_name, " ", managers.last_name) as "manager_name", dept_name, concat(employees.first_name, " ", employees.last_name) as "Employee Name"
from employees as managers #aliasing here allows us to "self join" the employees table.
join dept_manager using(emp_no)
join departments using(dept_no)
join dept_emp using(dept_no)
join employees on dept_emp.emp_no = employees.emp_no
where dept_manager.to_date > curdate()
and dept_emp.to_date > curdate();

# The quick fix solution for #11 Bonus
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd001'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd002'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd003'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd004'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd005'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd006'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd006'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd007'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd008'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd009'
order by salary DESC
limit 1);




