use employees;

# 1
# Find all the current employees with the same hire date as employee 101010 using a sub-query.
select *
from employees
where hire_date = (
    select hire_date
       from employees
          where emp_no = 101010
);


# 2
# Find all the titles ever held by all current employees with the first name Aamod.
select title
from titles
where to_date > now()
and emp_no in (
    select emp_no
       from employees
         where first_name = "Aamod"
);

# 3
# How many people in the employees table are no longer working for the company? 
# Give the answer in a comment in your code.
select count(*) # count all the records
from employees # from the employees table
where emp_no not in (   # where the emp_no ain't in this list of folks currently employed.
	select *
	from dept_emp
	where to_date > now()
);


# 4
# Find all the current department managers that are female. List their names in a comment in your code.
select *
from employees
where emp_no in (
    select emp_no
       from dept_manager
          where to_date > now()
)
and gender = "F";


# 5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select *
from employees
where emp_no in (
    select emp_no
    from salaries
          where salary > (select avg(salary) from salaries)
    );

# 6
# How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

select count(*)
from salaries
where to_date > now()
and salary > (select max(salary) - std(salary) from salaries where to_date > now());

# the next 3 lines make the denominator
select (select count(*) from salaries
        where to_date > now()
        and salary > (select max(salary) - std(salary) from salaries where to_date > now())
       )
       / # divide the count of salaries greater than 
    (select count(*) from salaries where to_date > now()) # denominator
    * 100 as "percentage of salaries within 1 standard deviation of max"; # format the output
    
    
    
    
    
    
    
    
    
    
# Bonus 1
# Find all the department names that currently have female managers.
select dept_name
from departments
where dept_no in (
    select dept_no
       from dept_manager
         where emp_no in (
		select emp_no
		from employees
		where gender = "F"
		)
		and to_date > now()
);

# Bonus 2
# Find the first and last name of the employee with the highest salary.
select concat(first_name, " ", last_name) as "Highest Paid Employee"
from employees
where emp_no = (
	select emp_no
	from salaries
	where salary = (select max(salary) from salaries where 	to_date > curdate())
	and to_date > curdate()
);



# Bonus 3
# Find the department name that the employee with the highest salary works in.
select *
from departments
where dept_no = (
	select dept_no
	from dept_emp
	where emp_no = (
		select emp_no
		from salaries
		where salary = (select max(salary) from salaries where to_date > curdate())
		and to_date > curdate()
		)
		and to_date > curdate()
);