use ryan;

create temporary table numbers as
-- db_name.table syntax
select * from numbers.numbers;

-- what database am I using?
select database();

select * from numbers;



CREATE TEMPORARY TABLE my_numbers(
    n INT NOT NULL 
);

DESCRIBE my_numbers;

-- INSERT is how we add records/rows to a table
INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5), (-2), (-7);

select * from my_numbers;

drop table my_numbers;

-- DB Operations:
-- CRUD
-- CREATE, READ, UPDATE, DELETE

-- Updating changes values in place
-- n = n + 1 means we're reassigning each row
UPDATE my_numbers SET n = n + 1;

select * from my_numbers;

-- If we update n = 10; this sets every row to 10
update my_numbers set n = 10;

update my_numbers set n = 0 where n < 0;

select * from my_numbers;

-- DELETE is pretty destructive
-- Always start your DELETE statement as if it were a SELECT (since the syntax is similar)
DELETE
from my_numbers
where n = 0;

select * from my_numbers;

-- What happens if you delete without a where clause?
delete from my_numbers;

select * from my_numbers;

-- Creating a temp table from a query
use ryan;
select database();

create temporary table georgis AS
select *
from employees.employees
join employees.salaries using(emp_no)
where first_name = "Georgi"; -- db_name.table_name

select * from georgis;


-- Another approach to reading from 1 db, writing to your db w/ permissions
use employees; -- use the db you'll read from

create temporary table ryan.partos AS
select *
from employees
join salaries using(emp_no)
where first_name = "Parto";

-- from here, we need to do db_name.table_name
select * from ryan.partos;

-- or, change what DB we're using:
use ryan;

-- update partos set salary = salary * 20;
select * from partos;

alter table partos drop column emp_no;

alter table partos add email VARCHAR(200);

update partos set email = concat(first_name, ".", last_name, "@company.com");

select * from partos;

alter table partos add phone VARCHAR(200);

update partos set phone = "210-226-3232";

-- What if we have a table w/ a unique key
-- What happens when we try to update that entire column to be the same?
-- nothing is entered b/c the unique key constraint keeps anything from happening w/ duplicates
use employees;

create temporary table ryan.partos AS
select *
from employees
join salaries using(emp_no)
where first_name = "Parto";

alter table ryan.partos add email VARCHAR(200);

ALTER TABLE ryan.partos ADD UNIQUE (email);

update ryan.partos set email = "partos@company.com";

select * from ryan.partos;


-- A Z-score is a measure of how many standard deviations away from the mean an observation is
use numbers;

select * from numbers;

-- Zscore = (x - population_mean) / standard_deviation
select avg(n) from numbers; -- 5.5 is the mean

-- unless you manually type out the mean, you'll need a scalar subquery for the mean
select n, n - (select avg(n) from numbers) as "numerator", 
(select std(n) from numbers) as "denominator"
from numbers;

-- since we can't select numerator / denominator, we'll make a new table to hold these values
-- create the temp table to hold n, numerator, denominator
create temporary table ryan.zscore AS
select n, 
n - (select avg(n) from numbers) as "numerator", 
(select std(n) from numbers) as "denominator"
from numbers;

use ryan;

-- add a new column to the temp table
alter table zscore add zscore float(10, 3);

-- set the values for that column on the temp table
update zscore set zscore = numerator / denominator;

-- zscore = (x - avg(x)) / std(x)
select * from zscore;