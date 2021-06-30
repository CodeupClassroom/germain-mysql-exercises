# Remember the "in" operator
select *
from employees
where first_name in ("Vidya", "Irena", "Maya");

# Scalar Subquery is a single query in parentheses that produces a single value


# Let's get the emp_no of everyone making more than avg salary
select *
from employees
where emp_no in (select emp_no
from salaries
where salary > (select avg(salary) from salaries)); # 63810.7448

select *
from salaries
where salary > (select avg(salary) from salaries);

# select TableA columns
# from Table A 
# Where tableA.column_of_interest in (
#    select tableB.column_of_interest
#    from tableB....
# )

# Get the names of all the current managers
select first_name, last_name
from employees
where emp_no in (
   select emp_no
   from dept_manager
   where to_date > now()
);

# Show me all the names for folks who are engineers
select *
from employees
where emp_no in (
   select emp_no
      from titles
         where title = "Engineer"
           and emp_no in (
                select emp_no
                    from employees
                        where hire_date like '%-12-25'
            )     # engineers hired on Christmas
);



# Aliasing a subquery to treat it as a "table"
# Have to have the alias for this "query as table" to work
select current_salary.salary
from (
	select *
	from salaries
	where to_date > now()
) as current_salary;

# Have to have the alias for this "query as table" to work
select *
from (
	select *
	from salaries
	where to_date > now()
) as current_salary
join employees using(emp_no);


select (select max(salary) from salaries) as max, min(salary) as min
from salaries
where to_date > now();