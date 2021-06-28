# substr("string/column of interest", index_inclusive, number_of_characters
select substr("first_name last_name", 1, position(" " in "first_name last_name"));

# We can use the position function to obtain the index of the space character
# substring captures up to, but not including the upper bound limit
select substr("Ryan Orsinger", 1, position(" " in "Ryan Orsinger"));
select substr("Hector Rodriguez Jr.", 1, position(" " in "Hector Rodriguez Jr."));

# Only using 2 arguments means we default to the rest of the string
select substr("Brandon Sharpe", position(" " in "Brandon Sharpe") + 1);

select position(" " in "Brandon Sharpe");

select substr(first_name, 1, 1), last_name from employees;

select upper(first_name), lower(last_name) from employees;

select upper(lower(upper(first_name))) from employees;

select replace("123-456-789", "-", "");

select replace(first_name, "G", "J") from employees;

select emp_no, datediff(curdate(), hire_date) as number_of_days_employed from employees
order by number_of_days_employed DESC;

select now(), curdate();

select now();

# Average is an aggregate function (aggregate takes many values, gives us one value)
select avg(salary) from salaries;

# Max is an aggregate
select max(salary) from salaries where to_date > curdate();

# Min is an aggregate
select min(salary) from salaries where to_date > curdate();

select truncate(sqrt(2), 3);

select truncate(pi() * 3, 2);

select cast("123.23" as float);


